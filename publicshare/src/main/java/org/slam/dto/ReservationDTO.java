package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class ReservationDTO {

	private int rno, bno;
	private String lender;
	//���°����� ����(sb) 
	//��û��: onapply, ������: onres, ��û �����: onapplyready(�����ʿ�), 
	//�뿩��: onloan, �ݳ���û��: onreturn, �ݳ��Ϸ�: returned
	//���� ���: cancel (onapplyready�� ���� ��Ҹ� ���� ����� ����ϴ��� ������� �ǳ� �ʿ� ��)
	//�뿩 ����: loanrejected
	//�ݳ� ����: returnrejected
	private String status; 
	private Date startDate;
	private Date returnDate;
	private Date resDate;
	private int lateFee;	
	
}
