package com.people3.model.vo;

import lombok.Data;

@Data
public class Reservation {
	
	private String id;
	private int coachNo;
	private String courtCode;
	private String revDate;
	private String revTime;
	private String rebType;
	
}