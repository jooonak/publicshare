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
	private int resCnt; //수정(sb)
	private int replycnt;
	private String img; //mainThumb으로 수정 필요(sb)
	private String[] imgFiles; //수정(sb)

}
