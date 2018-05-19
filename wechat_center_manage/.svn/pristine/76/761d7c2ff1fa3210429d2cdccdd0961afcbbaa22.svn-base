package com.wechat.cs.core.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateTimeUtils {
	private static final Logger logger = LoggerFactory.getLogger(DateTimeUtils.class);
	
	/**
	 * 日期时间字符串 转换为 毫秒数
	 * @param datetime yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static long parseDateTime(String datetime){
		try {
	        return SimpleDateFormat.getDateTimeInstance().parse(datetime).getTime();
        } catch (ParseException e) {
        	logger.error(ExceptionUtils.getFullStackTrace(e));
        }
		return 0;
	}

	
	/**
	 * 毫秒数 转换为 日期时间字符串 (yyyy-MM-dd HH:mm:ss)
	 * @param datetime System.currentTimeMillis()
	 * @return 
	 */
	public static String formatDateTime(long datetime){
		return SimpleDateFormat.getDateTimeInstance().format(new Date(datetime));
	}
	
	
	/**
	 * 日期字符串 转换为 毫秒数
	 * @param date yyyy-MM-dd
	 * @return
	 */
	public static long parseDate(String date){
		try {
	        return SimpleDateFormat.getDateInstance().parse(date).getTime();
        } catch (ParseException e) {
        	logger.error(ExceptionUtils.getFullStackTrace(e));
        }
		return 0;
	}
	
	
	/**
	 * 毫秒数  转换为 日期字符串(yyyy-MM-dd)
	 * @param date System.currentTimeMillis()
	 * @return
	 */
	public static String formatDate(long date){
		return SimpleDateFormat.getDateInstance().format(new Date(date));
	}
	
	
	/**
	 * 日期格式  转换为 日期时间字符串 (yyyy-MM-dd HH:mm:ss)
	 * @param date new Date()
	 * @return
	 */
	public static String formatDate(Date date){
		return SimpleDateFormat.getDateTimeInstance().format(date);
	}
	
	
	public static Date getDateFromString(String date){
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");    
		try {
			return format1.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return new Date();
	}
	
	
	/**
	 * 
	 * @param date 字符类型时间
	 * @param format 要转换成的格式 eg:"yyyy-MM-dd" or "yyyy-MM-dd HH:mm:ss" .......
	 * @return
	 */
	public static Date getDateFromString(String date,String format){
		DateFormat format1 = new SimpleDateFormat(format);    
		try {
			return format1.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return new Date();
	}
	public static String getDateStringFromString(String date,String format){
		DateFormat format1 = new SimpleDateFormat(format);    
		try {
			DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
			return format2.format(format1.parse(date));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}
	
	/**
	 * 计算两天时间差
	 * @param sdate 较小的时间
	 * @param enddate 较大的时间
	 * @return
	 * @throws ParseException
	 */
	public static int daysBetween(Date sdate,Date enddate) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		sdate=sdf.parse(sdf.format(sdate));
		enddate=sdf.parse(sdf.format(enddate));
		Calendar cal=Calendar.getInstance();
		cal.setTime(sdate);
		long stime=cal.getTimeInMillis();
		cal.setTime(enddate);
		long endtime=cal.getTimeInMillis();
		long days=(endtime-stime)/(1000*3600*24);
		return Integer.parseInt(String.valueOf(days));
	}
	
	/**
	 * 获得某个时间之前或之后的时间
	 * @param sdate
	 * @param daysBetween（相差的天数）
	 * @return
	 * @throws ParseException
	 */
	public static Date getDate(Date sdate,int daysBetween) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		sdate=sdf.parse(sdf.format(sdate));
		
		Calendar cal=Calendar.getInstance();
		cal.setTime(sdate);
		long stime=cal.getTimeInMillis();
		
		long dateTime=daysBetween*(1000*3600*24)+stime;
		
		
		return getDateFromString(formatDate(dateTime));
	}
	
	/**
	 * 生成 时间戳 组成 主键ID
	 * @return
	 */
	public static long getPrimaryId(){
		
		StringBuffer buffer = new StringBuffer();
		buffer.append(System.currentTimeMillis());
		for (int i=1;i<5;i++){
		    String rand=String.valueOf(new Random().nextInt(10));
		    buffer.append(rand);
		}
		return Long.valueOf(buffer.toString());
	}

	public static String getPrimaryIdString(){
		
		DateFormat format1 = new SimpleDateFormat("yyMMddHHmmss");    
		try {
			return format1.format(new Date())+String.valueOf(new Random().nextInt(10))
					+String.valueOf(new Random().nextInt(10))
					+String.valueOf(new Random().nextInt(10));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(System.currentTimeMillis());
	}
	
//-------- 数据库中日期格式：yyyyMMddHHmm--------------------------------	
	public static String getNowDateString(Date date){
		DateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");    
		try {
			return format1.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(System.currentTimeMillis());
	}
	
	
	public static void main(String[] args) {
		System.out.println(Long.valueOf("20150824121314") < Long.valueOf(getNowDateString(new Date())));
	}
}
