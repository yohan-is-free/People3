package com.people3.model.vo;

import lombok.Data;

@Data
public class Board {

	private int boardNo;
	private String id;
	private String title;
	private String content;
	private String date;
	private String count;
	private String boardType; // 공지사항 구분자
	
}