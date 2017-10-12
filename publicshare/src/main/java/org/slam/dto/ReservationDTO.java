package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class ReservationDTO {

	private int rno, bno, mno;
	private String isReturn; //�ݳ��� ���� ��..boolean ���� ���� Ȯ�� �ʿ�
	private Date startDate;
	private Date returnDate;
	private Date resDate;
	private int lateFee;
	
	
}
