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
		// �ش� member�� �˸��� �ޱ� ���� session���� member�� ������ �޾ƿ´�.

		request.getSession().setAttribute("notice", service.getNotice(member.getMid()));
		return true;
	}

}
