package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class MemberDTO {
	//mno 삭제(sb)
	private String mid;	
	private String mpw;
	private String mname;
	private Date joinDate;
	
	//nickname 추가 (bh)
	private String nickname;
	
}
