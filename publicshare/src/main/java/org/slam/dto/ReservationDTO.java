package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class ReservationDTO {

	private int rno, bno, mno;
	private String isReturn; //반납에 대한 값..boolean 가능 여부 확인 필요
	private Date startDate;
	private Date returnDate;
	private Date resDate;
	private int lateFee;
	
	
}
