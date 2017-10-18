package org.slam.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slam.dto.MemberDTO;
import org.slam.service.UserService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Inject
	UserService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("DO LOGIN CHECK INTERCEPTOR");

		Boolean useSession = WebUtils.getSessionAttribute(request, "member") != null ? true : false;
		// 현재 session에 member data가 담겨있으면 true, 없으면 false
		// (webutils.getSessionAttribute() = request.getSession.getAttribute())

		Cookie cookie = WebUtils.getCookie(request, "memberID");
		Boolean useCookie = cookie != null ? true : false;
		// 현재 cookie에 memberID data가 담겨있으면 true, 없으면 false

		if (useSession) {
			log.info("LOGIN CHECKED");

			return useSession;
		} else if (useCookie) {

			MemberDTO member = service.getMember(cookie.getValue());
			WebUtils.setSessionAttribute(request, "member", member);

			return useCookie;
		}

		response.sendRedirect("/login");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String result = (String) modelAndView.getModel().get("logout");
		Cookie loginCookie = WebUtils.getCookie(request, "memberID");
		HttpSession session = request.getSession();

		if (result != null) {

			session.removeAttribute("member");
			
			
			if (loginCookie != null) {
				loginCookie.setValue(null);
				loginCookie.setMaxAge(0);
				
				response.addCookie(loginCookie);
			}
		}
	}
}
