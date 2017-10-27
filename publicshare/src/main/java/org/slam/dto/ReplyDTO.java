package org.slam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {

	private int reno;
	private String reply,replyer;
	private Date replydate;
	private int bno;// book rno와 연결?
	private String delreply;
	
	//대댓글 관련 추가
	private String replytree;
	//조인 데이터 가져오려고 추가함(hb)
	private String nickname;
	
	
}
