package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class ReservationDTO {

	private int rno, bno;
	private String mid;
	//상태값으로 변경(sb) 
	//예약중: onres, 예약 대기중: onresready(수정필요), 신청중: onapply, 대여중: onloan, 반납완료: returned, 반납요청중: onreturn
	private String status; 
	private Date startDate;
	private Date returnDate;
	private Date resDate;
	private int lateFee;	
	
}
