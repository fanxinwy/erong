package nw.mvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

public class ResponseUtils {
	
	public static final String RES_CODE = "code";
	public static final String RES_MSG = "msg";
	public static final String RES_BODY = "body";
	
	public static final int DEFAULT_CODE = 200;
	public static final String DEFAULT_MSG = "success";
	
	
	public static ModelAndView modelView(String viewName, String k, Object v){
		return new ModelAndView(viewName, k, v);
	}
	
	public static ModelAndView modelView(String viewName, Map<String, ?> data){
		return new ModelAndView(viewName, data);
	}
	
	public static ModelAndView modelView(String viewName){
		return new ModelAndView(viewName);
	}
	
	public static ModelAndView jsonView(Map<String, ?> data){
		MappingJackson2JsonView jv = new MappingJackson2JsonView();
		jv.setAttributesMap(data);
		ModelAndView mv = new ModelAndView(jv);
		return mv;
	}
	
	public static ModelAndView jsonView(int code, String msg){
		return jsonView(createBody(code, msg));
	}
	
	public static ModelAndView jsonView(Object body){
		return jsonView(createBody(DEFAULT_CODE, DEFAULT_MSG, body));
	}
	
	public static ModelAndView jsonView(int code, String msg, Object body){
		return jsonView(createBody(code, msg, body));
	}
	
	public static Map<String, ?> createBody(int code, String msg, Object body){
		Map<String, Object> res = new HashMap<>();
		res.put(RES_CODE, code);
		res.put(RES_MSG, msg);
		if(body != null){
			res.put(RES_BODY, body);
		}
		return res;
	}
	
	public static Map<String, ?> createBody(Object body){
		return createBody(DEFAULT_CODE, DEFAULT_MSG, body);
	}
	
	public static Map<String, ?> createBody(int code, String msg){
		return createBody(code, msg, null);
	}

}
