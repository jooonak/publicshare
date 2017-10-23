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
	private int lateFee;
	private String img;
	private int resCnt; //¼öÁ¤(sb)
	private int replycnt;

}
