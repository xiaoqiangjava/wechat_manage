package com.wechat.cs.core.utils;

import com.alibaba.fastjson.JSONObject;
import com.wechat.cs.core.common.entity.HandlerResult;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 功能说明
 * 对字符串处理工具类
 */
public class StringUtils {
	private static Logger log=Logger.getLogger(StringUtils.class);
	
	public static final String KEYWORD_IMPORT = "会员批量导入已经成功！";

	public static final String ALLOWED_CHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.!~*'()";

	public static final String RANDOM_STR = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	public static final Random random = new Random();
	/**
	 * 转码
	 * @param input
	 * @return
	 */
	public static String encodeURIComponent(String input) {
		if (StringUtils.isEmpty(input)) {
			return input;
		}

		int l = input.length();
		StringBuilder o = new StringBuilder(l * 3);
		try {
			for (int i = 0; i < l; i++) {
				String e = input.substring(i, i + 1);
				if (ALLOWED_CHARS.indexOf(e) == -1) {
					byte[] b = e.getBytes("utf-8");
					o.append(getHex(b));
					continue;
				}
				o.append(e);
			}
			return o.toString();
		} catch (UnsupportedEncodingException e) {
			log.error(e.getMessage());
		}
		return input;
	}

	/**
	 * 解码
	 * @param encodedURI
	 * @return
	 */
	public static String decodeURIComponent(String encodedURI) {
		char actualChar;

		StringBuffer buffer = new StringBuffer();

		int bytePattern, sumb = 0;

		for (int i = 0, more = -1; i < encodedURI.length(); i++) {
			actualChar = encodedURI.charAt(i);

			switch (actualChar) {
			case '%': {
				actualChar = encodedURI.charAt(++i);
				int hb = (Character.isDigit(actualChar) ? actualChar - '0'
						: 10 + Character.toLowerCase(actualChar) - 'a') & 0xF;
				actualChar = encodedURI.charAt(++i);
				int lb = (Character.isDigit(actualChar) ? actualChar - '0'
						: 10 + Character.toLowerCase(actualChar) - 'a') & 0xF;
				bytePattern = (hb << 4) | lb;
				break;
			}
			case '+': {
				bytePattern = ' ';
				break;
			}
			default: {
				bytePattern = actualChar;
			}
			}

			if ((bytePattern & 0xc0) == 0x80) { // 10xxxxxx
				sumb = (sumb << 6) | (bytePattern & 0x3f);
				if (--more == 0)
					buffer.append((char) sumb);
			} else if ((bytePattern & 0x80) == 0x00) { // 0xxxxxxx
				buffer.append((char) bytePattern);
			} else if ((bytePattern & 0xe0) == 0xc0) { // 110xxxxx
				sumb = bytePattern & 0x1f;
				more = 1;
			} else if ((bytePattern & 0xf0) == 0xe0) { // 1110xxxx
				sumb = bytePattern & 0x0f;
				more = 2;
			} else if ((bytePattern & 0xf8) == 0xf0) { // 11110xxx
				sumb = bytePattern & 0x07;
				more = 3;
			} else if ((bytePattern & 0xfc) == 0xf8) { // 111110xx
				sumb = bytePattern & 0x03;
				more = 4;
			} else { // 1111110x
				sumb = bytePattern & 0x01;
				more = 5;
			}
		}
		return buffer.toString();
	}

	private static String getHex(byte buf[]) {
		StringBuilder o = new StringBuilder(buf.length * 3);
		for (int i = 0; i < buf.length; i++) {
			int n = (int) buf[i] & 0xff;
			o.append("%");
			if (n < 0x10) {
				o.append("0");
			}
			o.append(Long.toString(n, 16).toUpperCase());
		}
		return o.toString();
	}

	/**
	 * 判断某个对象是否为空 集合类、数组做特殊处理
	 * 
	 * @param obj
	 * @return 如为空，返回true,否则false
	 * @author YZH
	 */
	@SuppressWarnings("rawtypes")
	public static boolean isEmpty(Object obj) {
		if (obj == null)
			return true;

		// 如果不为null，需要处理几种特殊对象类型
		if (obj instanceof String) {
			return obj.equals("");
		} else if (obj instanceof Collection) {
			// 对象为集合
			Collection coll = (Collection) obj;
			return coll.size() == 0;
		} else if (obj instanceof Map) {
			// 对象为Map
			Map map = (Map) obj;
			return map.size() == 0;
		} else if (obj.getClass().isArray()) {
			// 对象为数组
			return Array.getLength(obj) == 0;
		} else {
			// 其他类型，只要不为null，即不为empty
			return false;
		}
	}
	
	/**
	 * 不为空
	 * @param obj
	 * @return
	 */
	public static boolean isNotEmpty(Object obj) {
		return !isEmpty(obj);
	}

	/**
     * 使用StringTokenizer类将字符串按分隔符转换成字符数组
     * @param string 字符串 
     * @param divisionChar 分隔符
     * @return 字符串数组
     * @see [类、类#方法、类#成员]
     */
    public static String[] stringAnalytical(String string, String divisionChar)
    {
        int i = 0;
        StringTokenizer tokenizer = new StringTokenizer(string, divisionChar);
        
        String[] str = new String[tokenizer.countTokens()];
        
        while (tokenizer.hasMoreTokens())
        {
            str[i] = new String();
            str[i] = tokenizer.nextToken();
            i++;
        }
        
        return str;
    }
    
    /**
     * 字符串解析，不使用StringTokenizer类和java.lang.String的split()方法
     * 将字符串根据分割符转换成字符串数组
     * @param string 字符串
     * @param c 分隔符
     * @return 解析后的字符串数组
     */
    public static String[] stringAnalytical(String string, char c)
    {
        //字符串中分隔符的个数
        int count = 0;
        
        //如果不含分割符则返回字符本身
        if (string.indexOf(c) == -1)
        {
            return new String[]{string};
        }
        
        char[] cs = string.toCharArray();
        
        //过滤掉第一个和最后一个是分隔符的情况
        for (int i = 1; i < cs.length -1; i++)
        {
            if (cs[i] == c)
            {
                count++; //得到分隔符的个数
            }
        }
        
        String[] strArray = new String[count + 1];
        int k = 0, j = 0;
        String str = string;
        
        //去掉第一个字符是分隔符的情况
        if ((k = str.indexOf(c)) == 0)
        {
            str = string.substring(k + 1);
        }
        
        //检测是否包含分割符，如果不含则返回字符串
        if (str.indexOf(c) == -1)
        {
            return new String[]{str};
        }
        
        while ((k = str.indexOf(c)) != -1)
        {
            strArray[j++] = str.substring(0, k);
            str = str.substring(k + 1);
            if ((k = str.indexOf(c)) == -1 && str.length() > 0)
            {
                strArray[j++] = str.substring(0);
            }
        }
        
        return strArray;
    }

    /**
     * 去除null以及空格串
     * @return:
     * @author: YZH
     */
    public static String noNull(Object s) {
        if (s == null)
            return "";
        else
            return s.toString().trim();
    }
    
	/**
     * 
     * {将文件名中的汉字转为UTF8编码的串,以便下载时能正确显示另存的文件名}
     * @param s 原文件名
     * @return  重新编码后的文件名
     * @author: YZH
     */
    public static String toUtf8String(String s) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if ((c >= 0) && (c <= 255)) {
                sb.append(c);
            }
            else {
                byte[] b;

                try {
                    b = Character.toString(c).getBytes("UTF-8");
                }
                catch (Exception ex) {
                    
                    b = new byte[0];
                }
                for (int j = 0; j < b.length; j++) {
                    int k = b[j];
                    if (k < 0) {
                        k += 256;
                    }
                    sb.append("%" + Integer.toHexString(k).toUpperCase());
                }
            }
        }
        return sb.toString();
    }

    public static boolean arryContain(String[]arr,String s2){
    	for(int i=0;i<arr.length;i++){
    		String si=arr[i];
    		if(si.equals(s2)){
    			return true;
    		}
    	}
    	return false;
    }
    //格式化时间
    public static String formatNum(Object num,String pattern){
    	DecimalFormat df = new DecimalFormat(pattern);
    	String db = df.format(num);
    	return db;
    }

    //字符串转换成日期(包括年月日时分秒)
    public static Date stringToDateTime(String str,String pattern){
    	SimpleDateFormat sdf=new SimpleDateFormat(pattern);
    	Date dt=null;
    	try {
    		dt = sdf.parse(str);
    		return dt;
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			return null;
		}
    }

    public static String checkTips(String tips) {
        StringBuffer sb = new StringBuffer();
        sb.append("<script type=\"text/javascript\">").append("alert('").append(tips)
                .append("');window.history.back();").append("</script>");
        return sb.toString();
    }
    
    /**
     * 隐藏最后几位手机号
     * @return
     */
    public static String hidePhoneNum(String phone,int num){
    	if(isEmpty(phone)){
    		throw new NullPointerException("手机号码不能为空");
    	}
    	if(phone.length()<num){
    		throw new IllegalArgumentException("手机号码长度不能小于隐藏长度");
    	}
    	return phone.substring(0, phone.length()-num) + getRepeatStr("*", num);
    }
    
    public static String getRepeatStr(String str,int num){
    	StringBuilder sb = new StringBuilder(num+10);
    	for(int i=0;i<num;i++){
    		sb.append(str);
    	}
    	return sb.toString();
    }
    
    /**
     * 获取长度为length的随机字符串
     * @param lenth
     * @return
     */
    public static String getRandomString(int length){
    	StringBuilder sb = new StringBuilder(length);
    	for(int i=0;i<length;i++){
    		sb.append(RANDOM_STR.charAt(random.nextInt(62)));
    	}
    	return sb.toString();
    }
    
    public static String getRandomNum(int length){
    	StringBuilder sb = new StringBuilder(length);
    	for(int i=0;i<length;i++){
    		sb.append(random.nextInt(10));
    	}
    	return sb.toString();
    }
    
    /**
     * 获取热线座机中的横杠
     * @param  @param number
     * @param  @return   
     * @return String  
     */
    public static String replacePhoneNum(String number){
    	if(StringUtils.isEmpty(number)){
			return null;
		}else{
			String hotline = number.replace("-", "").replace("—", "").replace("－", "");
			return hotline;
		}
    }
    //获取收益函id
    public static String getOrderNum(){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	Date curDate=new Date();
    	String nowDate=sdf.format(curDate);
    	String randomNum=StringUtils.getRandomNum(5);
    	String orderNum=nowDate.concat(randomNum);
    	return orderNum;
    }
    
    public static List<String> stringAnalyticalList(String string, String c)
    {
    	List<String> list = null ;
    	if(StringUtils.isEmpty(string))
    	{
    		return null ;
    	}
    	list = new ArrayList<String>();
    	 if (string.indexOf(c) == -1)
         {
    		 list.add(string);
             return list;
         }else
         {
        	 String[] strings=stringAnalytical(string,c);
        	 for(String s:strings)
        	 {
        		 list.add(s);
        	 }
        	 return list;
         }
    }
    /**
     * 数组按分隔符组合成一个字符串
     * @param strs字符串数组
     * @param splitStr分隔符
     * @return
     */
    public static String combineKeywords(Object[]strArr,String splitStr){
    	String str="";  
        for(int i=0;i<strArr.length&&strArr[i]!=null;i++){
        	str=str.concat(strArr[i].toString()).concat(splitStr);
        }
        str=str.substring(0, str.length()-1);
        return str;  
    }
    
    /**
     * 根据key获取url中的value
     * @param  @param url
     * @param  @param key
     * @param  @return   
     * @return String  
     * @throws 
     * @since
     */
	public static String getUrlVal(String url,String key){
		if(StringUtils.isNotEmpty(url)){
			String[] params = url.split("&");
			for(String parm:params){
				if(parm.startsWith(key+"=")){
					return parm.split("=")[1];
				}
			}
		}
		return null;
	}
	
	/**
	 * 
	 * @param str 字符串
	 * @param contain 被包含字符
	 * @return 被包含次数
	 */
	public static int stringContainNum(String str,String contain){
		int t=0;
		for (int i = 0; i <str.length(); i++) {
			String b = str.substring(i,i+1);
			if(b.equals(contain)){
				t++;
			}
		}
		return t;
	}

	/**
	 *
	 * @param str
	 * @return
	 */
	public static String replaceBlank(String str) {
		String dest = "";
		if (str!=null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
		}
		return dest;
	}

	public static void printJson(HttpServletResponse response, HandlerResult result) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter writer = null;
		try {
			writer =  response.getWriter();
			writer.print(JSONObject.toJSON(result));
			writer.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				writer.close();
			}
		}
	}

	public static void main(String[] args){
		String s = "aaa";
		System.out.println(isEmpty(s));
		System.out.println(isNotEmpty(s));
	}
	
}
