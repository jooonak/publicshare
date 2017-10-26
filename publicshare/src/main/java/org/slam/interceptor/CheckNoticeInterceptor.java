package org.slam.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slam.dto.MemberDTO;
import org.slam.service.UserService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class CheckNoticeInterceptor extends HandlerInterceptorAdapter {

	@Inject
	UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("DO NOTICE CHECK INTERCEPTOR........");

		MemberDTO member = (MemberDTO) WebUtils.getSessionAttribute(request, "member");
		// 해당 member의 알림을 받기 위해 session에서 member의 정보를 받아온다.

		request.getSession().setAttribute("notice", service.getNotice(member.getMid()));
		return true;
	}

}
