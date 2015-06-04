package ky.mvc;

import java.util.HashMap;
import java.util.Map;

public class ResponseUtils {
	
	public static final String RES_CODE = "code";
	public static final String RES_MSG = "msg";
	public static final String RES_BODY = "body";
	
	public static final int DEFAULT_CODE = 200;
	public static final String DEFAULT_MSG = "success";
	
	public static Map<String, Object> createBody(int code, String msg, Object body){
		Map<String, Object> res = new HashMap<>();
		res.put(RES_CODE, code);
		res.put(RES_MSG, msg);
		if(body != null){
			res.put(RES_BODY, body);
		}
		return res;
	}
	
	public static Map<String, Object> createBody(Object body){
		return createBody(DEFAULT_CODE, DEFAULT_MSG, body);
	}
	
	public static Map<String, Object> createBody(int code, String msg){
		return createBody(code, msg, null);
	}

}
