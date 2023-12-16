package com.acorn.tour.location;

public class contentinfoDTO {
	
	

	String contentid;
	int contenttypeid;
	String cat1;
	String cat2;
	String cat3;
	String title;
	int sidocode;
	String sigungucode;
	String address;
	String tel;
	String createdtime;
	String modifiedtime;
	String mapx;
	String mapy;
	int MLEVEL;
	String firstimage;
	String firstimage2;
	int view_cnt;
	String overview;
	
	
	
	public contentinfoDTO() {}
	
	
	
	public contentinfoDTO(String contentid, int contenttypeid, String cat1, String cat2, String cat3, String title,
			int sidocode, String sigungucode, String address, String tel, String createdtime, String modifiedtime,
			String mapx, String mapy, int mLEVEL, String firstimage, String firstimage2, int view_cnt,
			String overview) {
		super();
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.cat3 = cat3;
		this.title = title;
		this.sidocode = sidocode;
		this.sigungucode = sigungucode;
		this.address = address;
		this.tel = tel;
		this.createdtime = createdtime;
		this.modifiedtime = modifiedtime;
		this.mapx = mapx;
		this.mapy = mapy;
		MLEVEL = mLEVEL;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.view_cnt = view_cnt;
		this.overview = overview;
	}
	
	
	
	public String getContentid() {
		return contentid;
	}



	public void setContentid(String contentid) {
		this.contentid = contentid;
	}



	public int getContenttypeid() {
		return contenttypeid;
	}



	public void setContenttypeid(int contenttypeid) {
		this.contenttypeid = contenttypeid;
	}



	public String getCat1() {
		return cat1;
	}



	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}



	public String getCat2() {
		return cat2;
	}



	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}



	public String getCat3() {
		return cat3;
	}



	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public int getSidocode() {
		return sidocode;
	}



	public void setSidocode(int sidocode) {
		this.sidocode = sidocode;
	}



	public String getSigungucode() {
		return sigungucode;
	}



	public void setSigungucode(String sigungucode) {
		this.sigungucode = sigungucode;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getCreatedtime() {
		return createdtime;
	}



	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}



	public String getModifiedtime() {
		return modifiedtime;
	}



	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}



	public String getMapx() {
		return mapx;
	}



	public void setMapx(String mapx) {
		this.mapx = mapx;
	}



	public String getMapy() {
		return mapy;
	}



	public void setMapy(String mapy) {
		this.mapy = mapy;
	}



	public int getMLEVEL() {
		return MLEVEL;
	}



	public void setMLEVEL(int mLEVEL) {
		MLEVEL = mLEVEL;
	}



	public String getFirstimage() {
		return firstimage;
	}



	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}



	public String getFirstimage2() {
		return firstimage2;
	}



	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}



	public int getView_cnt() {
		return view_cnt;
	}



	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}



	public String getOverview() {
		return overview;
	}



	public void setOverview(String overview) {
		this.overview = overview;
	}



	


	
	@Override
	public String toString() {
		return "LocationDTO [contentid=" + contentid + ", contenttypeid=" + contenttypeid + ", cat1=" + cat1 + ", cat2="
				+ cat2 + ", cat3=" + cat3 + ", title=" + title + ", sidocode=" + sidocode + ", sigungucode="
				+ sigungucode + ", address=" + address + ", tel=" + tel + ", createdtime=" + createdtime
				+ ", modifiedtime=" + modifiedtime + ", mapx=" + mapx + ", mapy=" + mapy + ", MLEVEL=" + MLEVEL
				+ ", firstimage=" + firstimage + ", firstimage2=" + firstimage2 + ", view_cnt=" + view_cnt
				+ ", overview=" + overview + "]";
	}


	
	

}
