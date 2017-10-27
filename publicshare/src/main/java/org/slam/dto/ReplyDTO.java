package org.slam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {

	private int reno;
	private String reply,replyer;
	private Date replydate;
	private int bno;// book rno�� ����?
	private String delreply;
	
	//���� ���� �߰�
	private String replytree;
	//���� ������ ���������� �߰���(hb)
	private String nickname;
	
	
}
