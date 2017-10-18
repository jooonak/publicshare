package org.slam.dto;

import java.util.Date;

import lombok.Data;
import lombok.extern.java.Log;

@Log
@Data
public class MemberDTO {
	//mno ªË¡¶(sb)
	private String mid;	
	private String mpw;
	private String mname;
	private Date joinDate;
	
}
