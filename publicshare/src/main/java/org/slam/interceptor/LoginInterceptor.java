package org.slam.interceptor;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slam.dto.MemberDTO;
import org.slam.service.UserService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		Boolean logined = WebUtils.getSessionAttribute(request, "member") != null ? false : true;
//		Boolean hasCookie = WebUtils.getCookie(request, "memberID") != null ? false : true;
//		
//		return logined ? hasCookie : logined;
//	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		if (request.getMethod().equals("GET")) {
			return;
		}
		// 접근방식이 GET일때에는 처리할 필요 X

		log.info("DO LOGIN INTERCEPTOR.....");

		Map<String, Object> map = modelAndView.getModel();
		// UserController에서 Model에 addAttribute한 값은 modelAndView에서 Map형식으로 받을 수 있음
		MemberDTO member = (MemberDTO) map.get("member");

		if (member != null) {
			// 입력받은 data가 db에 존재할 때 처리
			request.getSession().setAttribute("member", member);
			// 세션에 정보를 담는다

			if (request.getParameter("auto") != null) {
				// 자동 로그인 체크가 됐을 때 처리
				Cookie loginCookie = new Cookie("memberID", member.getMid());

				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				// 쿠키에 memberID를 담고 MaxAge를 7주일로 지정

				response.addCookie(loginCookie);

				log.info("useCookie");
			}
			log.info("useSession");
		} else {
			log.info("No Match");
		}

	}

}
