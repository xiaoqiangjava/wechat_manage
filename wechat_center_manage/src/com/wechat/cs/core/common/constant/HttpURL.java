package com.wechat.cs.core.common.constant;

public class HttpURL {

	public static String  GGK_URL= "http://wap.js.10086.cn/new_weixin_act/ggk/index?activityCode=";//190
	public static String  YYY_URL= "http://wap.js.10086.cn/new_weixin_act/yyy/index?activityCode=";//190
	public static String  DZP_URL= "http://wap.js.10086.cn/new_weixin_act/dzpts/index?activityCode=";//190
	public static String  ZJD_URL= "http://wap.js.10086.cn/new_weixin_act/zjd/index?activityCode=";//190
	public static String  WJDC_URL= "http://wap.js.10086.cn/new_weixin_act/wjdc/index?wjdcId=";//190
	
	// 188 , 190 
//	public static String  rootURL = "http://221.178.251.156/xwwt";//188
//	public static String  WEB_URL_SITE= "http://221.178.251.167:8080/xwwt_web";//190

	public static String  rootURL = "http://127.0.0.1:8900/xwwtapi";//192-9090
	public static String  WEB_URL_SITE= "http://mms.neunn.com/xwwt_web";//192-9090
	
	//用户登陆
	public static String sysUserLOGIN = rootURL +"/LOGIN";
	//用户注册
	public static String sysUserADD = rootURL +"/ADDUSER";
	//上传文件
	public static String uploadFile = "http://127.0.0.1:8900/xwwtapi/UPLOAD";
	//上传图文
	public static String uploadNews = rootURL +"/UPLOADNEWS";
	
	//注册公众号
	public static String  publicInfoREG = rootURL+"/REG";
	//自定义菜单生成
	public static String  initPublicMenu = rootURL+"/INITMENU";
	
	//刷新token
	public static String  getToken = rootURL+"/ACCESSTOKEN";
	
	/**
	 * 创建分组接口
	 * wpname , name
	 */
	public static String  userGroupCreate = rootURL+"/CREATEGROUP";
	//查询所有分组
	public static String  getGroups = rootURL+"/GETGROUPS";
	
	//发送文本消息
	public static String  sendTextMsg = rootURL+"/SENDTEXT";
	//获取观众者列表
	public static String getOpenid = rootURL+"/GETUSERLIST";
	//发送图片消息
	public static String sendImagMsg = rootURL+"/SENDIMG";
	
	//发送图文消息
	public static String sendNews = rootURL+"/SENDNEWS";
	//创建用户组
	public static String createNewGroup = rootURL+"/CREATEGROUP";
	//跟新用户分组
	public static String updateUserGroup = rootURL+"/UPDATEUSERGROUP";
	
	//根据分组群发文本内容
	public static String MASSGROUPTEXT  = rootURL+"/MASSGROUPTEXT";
	public static String MASSGROUPIMAGE = rootURL+"/MASSGROUPIMAGE";
	public static String MASSGROUPNEWS  = rootURL+"/MASSGROUPNEWS";

	//根据openid群发
	public static String MASSOPENIDSTEXT = rootURL+"/MASSOPENIDSTEXT";
	public static String MASSOPENIDSIMAGE = rootURL+"/MASSOPENIDSIMAGE";
	public static String MASSOPENIDSNEWS = rootURL+"/MASSOPENIDSNEWS";
	
}
