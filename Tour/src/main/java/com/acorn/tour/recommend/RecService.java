package com.acorn.tour.recommend;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecService {
	@Autowired 
	RecRepository rec;
	
	public String getAreaName(int selectedArea) {
		if(selectedArea>=39) { 
	    	int sidocode = selectedArea/1000;
	    	String sigungucode = Integer.toString(selectedArea);
	    	String sido = rec.getSidoName(sidocode);
	    	String sigungu = rec.getSigunguName(sigungucode);
	    	String area = sido + " "+sigungu;
	    	return area;
	    }else{
	    	String area = rec.getSidoName(selectedArea);
	    	return area;
	    }
	}
	public Map<String, Object> getRecInfo(int count, String[] recList){
		
		Map<String, Object> recMap = new HashMap<>();
		Set<Integer> randomSpot = new HashSet<>();
	    Set<Integer> randomRestaurant = new HashSet<>();
	    while (randomSpot.size() < count) {
            int randomNumber = ThreadLocalRandom.current().nextInt(0, 9 + 1);
            randomSpot.add(randomNumber);
        }
        while (randomRestaurant.size() < count) {
            int randomNumber = ThreadLocalRandom.current().nextInt(10, 19 + 1);
            randomRestaurant.add(randomNumber);
        }
        ArrayList<RecSpot> allRecSpots = new ArrayList<>();
        ArrayList<RecRestaurant> allRecRestaurant = new ArrayList<>();
        for (int number : randomSpot) {
        	List<RecSpot> recspot = rec.recSpot(recList[number]);
        	allRecSpots.addAll(recspot);
        }
        for (int number : randomRestaurant) {
        	List<RecRestaurant> recFood = rec.recFood(recList[number]);
        	allRecRestaurant.addAll(recFood);
        }
        recMap.put("spot",allRecSpots);
        recMap.put("restaurant", allRecRestaurant);
        return recMap;
	}
	public void manipulateLists(ArrayList<Object> all, ArrayList<RecSpot> spot, ArrayList<RecRestaurant> food) {
        // 기저 조건: spot과 food 리스트가 비어있으면 종료
		
        if (spot.isEmpty() && food.isEmpty()) {
            return;
        }

        // Object 리스트에 spot.get(1) 추가
        // spot 리스트를 기준으로 food 리스트 정렬
        // spot 리스트에서 spot.get(1) 삭제
        // Object 리스트에 food.get(1) 추가
        if (!spot.isEmpty()&& !food.isEmpty()) {
            all.add(spot.get(0));
            sortRestaurantByDistance(food,spot.get(0));
            spot.remove(0);
            all.add(food.get(0));
            sortPlacesByDistance(spot,food.get(0));
            food.remove(0);
        }
       
        if (spot.isEmpty()&&!food.isEmpty()) {
        	all.add(food.get(0));
        }

        // 재귀 호출: 리스트가 비어있지 않으면 다시 manipulateLists 함수 호출
        manipulateLists(all, spot, food);
    }
	public Double getDistance(RecSpot a, RecRestaurant b) {
        double theta = Double.parseDouble(a.mapx)-Double.parseDouble(b.mapx);
        double dist = Math.sin(deg2rad(Double.parseDouble(a.mapy)))* Math.sin(deg2rad(Double.parseDouble(b.mapy))) + Math.cos(deg2rad(Double.parseDouble(a.mapy)))*Math.cos(deg2rad(Double.parseDouble(b.mapy)))*Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60*1.1515*1609.344;
        return dist / 1000;
    }
	public Double getDistance1(RecRestaurant a, RecSpot fixedPlace) {
        double theta = Double.parseDouble(a.mapx)-Double.parseDouble(fixedPlace.mapx);
        double dist = Math.sin(deg2rad(Double.parseDouble(a.mapy)))* Math.sin(deg2rad(Double.parseDouble(fixedPlace.mapy))) + Math.cos(deg2rad(Double.parseDouble(a.mapy)))*Math.cos(deg2rad(Double.parseDouble(fixedPlace.mapy)))*Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60*1.1515*1609.344;
        return dist / 1000;
    }
	public Double getDistanceObject(Object a, Object b) {
	    if (a instanceof RecSpot && b instanceof RecRestaurant) {
	        RecSpot spot = (RecSpot) a;
	        RecRestaurant restaurant = (RecRestaurant) b;
	        return getDistance(spot,restaurant);
	    } else if (a instanceof RecRestaurant && b instanceof RecSpot) {
	        RecRestaurant restaurant = (RecRestaurant) a;
	        RecSpot spot = (RecSpot) b;
	        return getDistance1(restaurant,spot);
	    }
	    return 0.0; // 기본값 또는 오류 처리
	}
	public double deg2rad(double deg){
        return (deg * Math.PI/180.0);
    }

	public double rad2deg(double rad){
        return (rad * 180 / Math.PI);
    }
	public void sortPlacesByDistance(List<RecSpot> places, RecRestaurant fixedPlace) {
        Collections.sort(places, new Comparator<RecSpot>() {
            @Override
            public int compare(RecSpot a, RecSpot b) {
                double distanceAtoFixed = getDistance(a, fixedPlace);
                double distanceBtoFixed = getDistance(b, fixedPlace);
                return Double.compare(distanceAtoFixed, distanceBtoFixed);
            }
        });
    }
	public void sortRestaurantByDistance(List<RecRestaurant> places, RecSpot fixedPlace) {
        Collections.sort(places, new Comparator<RecRestaurant>() {
            @Override
            public int compare(RecRestaurant a, RecRestaurant b) {
                double distanceAtoFixed = getDistance1(a, fixedPlace);
                double distanceBtoFixed = getDistance1(b, fixedPlace);
                return Double.compare(distanceAtoFixed, distanceBtoFixed);
            }
        });
    }
	public String getTotalDistance(ArrayList<Object> obj) {
		double Distances = 0;
		for(int i=0; i<obj.size()-1; i++) {
			Distances +=getDistanceObject(obj.get(i),obj.get(i+1));
        }
		String totalDistance = String.format("%.2f", Distances);
		return totalDistance;
	}
	public String getTourCourse(Object obj) {
		String courseOne = "";
		if (obj instanceof RecSpot) {
			RecSpot spot = (RecSpot) obj;
			courseOne = spot.contentid;
		}else {
			RecRestaurant restaurant = (RecRestaurant) obj;
			courseOne = restaurant.contentid;
		}
		return courseOne;
		
	}
	
	

}
