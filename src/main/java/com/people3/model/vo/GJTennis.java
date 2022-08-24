package com.people3.model.vo;

import lombok.Data;

@Data
public class GJTennis {

	// 광주 시내 테니스장 정보
	private int courtNo;
	private String courtName;
	private String courtTel;
	private String courtAddr;
	private String imgPath;
	// 장내 코트수 
	private int courtCnt;
	// 레슨 가능 여부
	private String isLesson;
	
	
}