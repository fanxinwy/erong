package ky.mvc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ky.mvc.interceptor.annotation.AuthPassport;
import ky.service.UserService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			AuthPassport authPassport = ((HandlerMethod) handler).getMethodAnnotation(AuthPassport.class);
			if(authPassport == null || authPassport.value() == false){
				return true;
			}else{
				String token = (String) WebUtils.getSessionAttribute(request, UserService.TOKEN);
				if(!StringUtils.isEmpty(token)){
					return true;
				}else{
					String fromUrl = request.getRequestURI();
					response.sendRedirect("logon.html?s="+fromUrl);
					return false;
				}
			}
		}else{
			return true;
		}
	}

}
