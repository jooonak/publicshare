package org.slam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {

	private int reno;
	private String reply;
	private Date regdate;
	private int bno;// book rno�� ����?
}
