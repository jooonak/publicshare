package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class ReservationDTO {

	private int rno, bno;
	private String lender;
	//상태값으로 변경(sb) 
	//신청중: onapply, 예약중: onres, 신청 대기중: onapplyready(수정필요), 
	//대여중: onloan, 반납요청중: onreturn, 반납완료: returned
	//취소: cancel, 
	private String status; 
	private Date startDate;
	private Date returnDate;
	private Date resDate;
	private int lateFee;	
	
}
