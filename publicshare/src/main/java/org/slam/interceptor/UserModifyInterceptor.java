package org.slam.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slam.dto.MemberDTO;
import org.slam.service.UserService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserModifyInterceptor extends HandlerInterceptorAdapter {

	@Inject
	UserService service;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("--------------------------------------------------------------------------------------1");
		
		HttpSession session = request.getSession();
		System.out.println("--------------------------------------------------------------------------------------2");
		
		MemberDTO sessionID = (MemberDTO) request.getSession().getAttribute("member");
		//세션에서 받아온 유저의 정보
		System.out.println(sessionID + "--------------------------------------------------------------------------------------3");
		
		MemberDTO modifyedID = service.getMember(sessionID.getMid());
		//DB에서 ID를 통해 받아온 유저의 정보
		System.out.println(modifyedID + "--------------------------------------------------------------------------------------4");
		
		if(!sessionID.getMpw().equals(modifyedID.getMpw()) || !sessionID.getNickname().equals(modifyedID.getNickname())) {
			
			System.out.println(sessionID.getMpw() + "aslkjsgal" + modifyedID.getMpw() + "--------------------------------------------------------------------------------------5");
			
			session.removeAttribute("member");
			
			System.out.println("--------------------------------------------------------------------------------------6");
			
			session.setAttribute("member", modifyedID);
			
			System.out.println("--------------------------------------------------------------------------------------7");
		}
	}

}
