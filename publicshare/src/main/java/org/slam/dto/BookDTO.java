package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class BookDTO {
	
	private int bno;
	private String bname;
	private String publisher;
	private String owner;
	private Date regDate;
	private String available; //type Ȯ�� �ʿ�(boolean)
	private int lateFee;

}
