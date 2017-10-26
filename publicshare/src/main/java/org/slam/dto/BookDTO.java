package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Data
public class BookDTO {
	
	private int bno;
	private String bname;
	private String publisher;
	private String owner;
	private String contents;
	private Date regDate;
	private int lateFee;
	private int resCnt; //����(sb)
	private int replycnt;
	private String img; //mainThumb���� ���� �ʿ�(sb)
	private String[] imgFiles; //����(sb)

}
