package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class ReservationDTO {

	private int rno, bno;
	private String mid;
	//���°����� ����(sb) 
	//������: onres, ���� �����: onresready(�����ʿ�), ��û��: onapply, �뿩��: onloan, �ݳ��Ϸ�: returned, �ݳ���û��: onreturn
	private String status; 
	private Date startDate;
	private Date returnDate;
	private Date resDate;
	private int lateFee;	
	
}
