package com.acorn.tour.paging;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 매개변수 있는 생성자
public class PageHandler {
	//prj0911
	int currentPage;	// 현재페이지
	int totRecords;		// 총 레코드 수
	int pageSize;		// 페이지 사이즈(한 페이지에 보이는 글의 수)
	int grpSize;		// 그룹의 사이즈
	
	int totalPage;		// 전체 페이지 수
	int currentGrp;		// 현재 페이지가 속한 그룹
	int lastGrp;		// 마지막 그룹
	int grpStartPage;
	int grpEndPage;
	
	int startList;
	int endList;
	

	public PageHandler(int currentPage, int totRecords, int pageSize, int grpSize) {
		super();
		this.currentPage = currentPage;
		this.totRecords = totRecords;
		this.pageSize = pageSize;
		this.grpSize = grpSize;
		
		calcPage();
	}

	private void calcPage() {
		
		// 1. 총페이지수
		int remain = totRecords % pageSize;
		if(remain == 0) {
			totalPage = totRecords / pageSize;
		}else {
			totalPage = (totRecords / pageSize) + 1;
		}
		
		// 2. 현재그룹구하기
		int remain2 = currentPage % grpSize;
		if(remain2 == 0) {
			currentGrp = currentPage / grpSize;
		}else {
			currentGrp = (currentPage / grpSize) + 1;
		}
		
		// 3. 현재그룹 시작페이지
		grpStartPage = ((currentGrp-1) * grpSize) + 1;
		
		// 4. 현재그룹 마지막페이지
		grpEndPage = currentGrp * grpSize;
		if(grpEndPage > totalPage) {
			grpEndPage = totalPage;
		}
		
		// 5. 마지막 그룹
		int remain3 = totalPage % grpSize;
		if(remain3 == 0) {
			lastGrp = (totalPage / grpSize);
		}else {
			lastGrp = (totalPage / grpSize) + 1;
		}
		
		// 6. 현재 페이지 리스트 순서
		startList = (currentPage - 1 )* pageSize + 1;
		if(currentGrp == lastGrp && currentPage == grpEndPage) {
			if(remain == 0 ) {
				endList = currentPage * pageSize;
			}else {
				endList = startList + remain - 1;
			}
		}else {
			endList = currentPage * pageSize;
		}
		
	}
	
}
