package com.wechat.cs.core.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.util.StringUtils;

/**
 * 编码转换
 * @author Administrator
 *
 */
public class URLEncoderUtils {

	//传入参数时，转换编号
	public static String encodeUTF8(String param){
		if(StringUtils.hasLength(param)){
			try {
				return URLEncoder.encode(param,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "";
	}
	
	public static String getSuccessResult(String param){
		try {
			
			return new String(param.getBytes("UTF-8"),"UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}
}
