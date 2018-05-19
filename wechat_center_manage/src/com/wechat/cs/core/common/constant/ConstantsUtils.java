package com.wechat.cs.core.common.constant;

public class ConstantsUtils {
	
	
	public static String DBURL = "xwpush/x3y4Shs2@10.32.229.27";//sms_test/sms_test@CMP_10.32.65.238
	/**
	 * 当前公众号session  key
	 */
	public final static String CURRENTPUBLICINFO = "currentPublicInfo";

	//请求接口成功返回code值
	/**
	 * "0000"
	 */
	public final static String ResultCode = "0000";
	
	
	//自定义菜单事件  click,view
	/**
	 * "click"
	 */
	public final static String MENU_KEY_CLICK = "click";
	/**
	 * "view"
	 */
	public final static String MENU_KEY_VIEW = "view";
	
	public final static String MD5_SLAT = "661c4bae-d75f-4d14-b260-37652961be7f";//随机产生的UUID，加密盐
	public final static String ID_SPLIT_CHAR = ",";
	//服务器路径
	public final static String UPLAOD_MATERIAL_IMAGES_SAVE_PATH =  "/upload/material/images/";//图片素材路径
	public final static String UPLAOD_MATERIAL_NEWS_SAVE_PATH =  "/upload/material/news/";//图片素材路径
	public final static String UPLAOD_PUBLICINFO_SAVE_PATH =  "/upload/publicinfo/";//图片素材路径
	public final static String UPLAOD_MESSAGE_SAVE_PATH =  "/upload/message/";//图片路径-消息管理
	
	public final static String UPLAOD_SHOP_LOGOS_SAVE_PATH =  "/upload/shop/logos/";//店铺Logo路径
	public final static String UPLAOD_SHOP_GOODS_SAVE_PATH =  "/upload/shop/goods/";//商品图片路径

	public final static String UPLAOD_GGK_PIC_SAVE_PATH =  "/upload/ggk/";//刮刮卡 活动 图片路径
	public final static String UPLAOD_DZP_PIC_SAVE_PATH =  "/upload/dzp/";//大转盘 活动 图片路径
	public final static String UPLAOD_YYY_PIC_SAVE_PATH =  "/upload/yyy/";//摇一摇 活动 图片路径
	public final static String UPLAOD_ZJD_PIC_SAVE_PATH =  "/upload/zjd/";//砸金蛋 活动 图片路径
	public final static String UPLAOD_WJDC_PIC_SAVE_PATH =  "/upload/wjdc/";//问卷调查 活动 图片路径
	
	public final static long   UPLOAD_FILE_MAX_SIZE = 3000000;	

   //文件上传
	public final static long   UPLOAD_FRONT_VIEW_COVER_MAX_SIZE = 2048L; //前沿观点封面图片最大显示 2M
	
	//导入群发用户 模板文件
	public final static String DOWNLOAD_TEL_FILE_NAME ="导入群发用户模板.txt";
	public final static String DOWNLOAD_TEL_FILE ="/upload/file/download_tel_file.txt";
}
