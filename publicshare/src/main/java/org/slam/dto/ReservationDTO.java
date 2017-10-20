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
	//예약 취소: cancel (onapplyready에 대한 취소를 따로 명시해 줘야하는지 팀원들과 의논 필요 ♡)
	//대여 거절: loanrejected
	//반납 거절: returnrejected
	private String status; 
	private Date startDate;
	private Date returnDate;
	private Date resDate;
	private int lateFee;	
	
}
