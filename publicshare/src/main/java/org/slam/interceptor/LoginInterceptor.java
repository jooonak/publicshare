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
		// ���ٹ���� GET�϶����� ó���� �ʿ� X

		log.info("DO LOGIN INTERCEPTOR.....");

		Map<String, Object> map = modelAndView.getModel();
		// UserController���� Model�� addAttribute�� ���� modelAndView���� Map�������� ���� �� ����
		MemberDTO member = (MemberDTO) map.get("member");

		if (member != null) {
			// �Է¹��� data�� db�� ������ �� ó��
			request.getSession().setAttribute("member", member);
			// ���ǿ� ������ ��´�

			if (request.getParameter("auto") != null) {
				// �ڵ� �α��� üũ�� ���� �� ó��
				Cookie loginCookie = new Cookie("memberID", member.getMid());

				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				// ��Ű�� memberID�� ��� MaxAge�� 7���Ϸ� ����

				response.addCookie(loginCookie);

				log.info("useCookie");
			}
			log.info("useSession");
		} else {
			log.info("No Match");
		}

	}

}
