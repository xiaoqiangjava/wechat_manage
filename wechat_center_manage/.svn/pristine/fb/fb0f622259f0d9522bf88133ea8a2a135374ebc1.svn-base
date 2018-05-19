package com.wechat.cs.core.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

/**
 * 文件处理（上传下载）
 * @author bsh
 *
 */
public class FileOperateUtils {


	/**
	 * 文件图片-绝对路径-截取
	 * @param imageUrl
	 * @return
	 * imageUrl = /home/chensheng/files/mhgh/images/course/ce59ab2c-075c-4947-822b-2419e5c6974b.jpg
	 * return  =  mhgh/images/course/ce59ab2c-075c-4947-822b-2419e5c6974b.jpg
	 */
//	public static String getAbsoluteFilePath(String imageUrl){
//		
//		if(imageUrl.indexOf(Constants.UPLOAD_FILE_SAVE_PATH) >= 0){
//			imageUrl = imageUrl.substring(Constants.UPLOAD_FILE_SAVE_PATH.length()); //去掉绝对路径
//		}
//		return imageUrl;
//	}
	
	/**
	 * 上传文件
	 */
	public static String uploadFile(MultipartFile file,StringBuffer filePath){
		String newFileName = null;
		try {
			File dir = new File(filePath.toString());//文件保存路径
			if(!dir.exists()){
				dir.mkdirs();
			}
			String originalFilename = file.getOriginalFilename();
			int dot = originalFilename.lastIndexOf(".");
			String extension = "";
			if(dot > 0) {
				extension = originalFilename.substring(dot, originalFilename.length());
			}
			newFileName = UUID.randomUUID().toString()+extension;//新的文件名
			
			filePath.append("/"+newFileName);
			
			File out = new File(filePath.toString());
			FileCopyUtils.copy(file.getBytes(), out);//上传
			filePath.delete(0, filePath.length());
		} catch (Exception e) {
			newFileName = null;
			e.printStackTrace();
		}
		return newFileName;
	}
	
	
	/**
	 * 下载文件
	 * @param request
	 * @param response
	 * @param storeName
	 * @param contentType
	 * @param realName
	 * @throws Exception
	 */
	 public static void download(HttpServletRequest request,  
	            HttpServletResponse response, String storeName, String contentType,  
	            String realName) throws Exception {  
	        response.setContentType("text/html;charset=UTF-8");  
	        request.setCharacterEncoding("UTF-8");  
	        BufferedInputStream bis = null;  
	        BufferedOutputStream bos = null;  
	  
	        String ctxPath = request.getSession().getServletContext()  
	                .getRealPath("") ;  
	        String downLoadPath = ctxPath + storeName;  
	  
	        long fileLength = new File(downLoadPath).length();  
	  
	        response.setContentType(contentType);  
	        response.setHeader("Content-disposition", "attachment; filename="  
	                + new String(realName.getBytes("utf-8"), "ISO8859-1"));  
	        response.setHeader("Content-Length", String.valueOf(fileLength));  
	  
	        bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
	        bos = new BufferedOutputStream(response.getOutputStream());  
	        byte[] buff = new byte[2048];  
	        int bytesRead;  
	        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
	            bos.write(buff, 0, bytesRead);  
	        }  
	        bis.close();  
	        bos.close();  
	    }  
	 
	 
	 public static String getFileSizeToKB(Long size){
		 String result = "0";
		 if(size != null){
			 DecimalFormat df2 = new DecimalFormat("###.0");
			 result = df2.format(size/1024.0);
		 }
		 return result;	
	 }
	 
	 //导入群发时读取
	 public static List<String> readFile(MultipartFile file){
		 List<String> list = new ArrayList<String>();
			try {
//				File temp= new File("temp.txt");
//				file.transferTo(temp);
				InputStream in = file.getInputStream();
				BufferedReader br = new BufferedReader(new InputStreamReader(in));
				String s = null;
                while((s = br.readLine())!=null){//使用readLine方法，一次读一行
                    list.add(s);
                }
                br.close();
                in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	
	 /**
	  * 删除文件
	  * @param fileUrl
	  */
	 public static void removeFile(HttpServletRequest request, String fileUrl){
		 try {
			 boolean b = false;
			 String realPath = request.getSession().getServletContext().getRealPath("");
				String filePath = realPath+fileUrl;
				File file = new File(filePath);
				if(file != null && file.exists() && file.isFile()){
					b= file.delete();
				}
			System.out.println(" remove file result  = "+b);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }
	 
	 public static boolean isNumber(String tel){
		java.util.regex.Pattern pattern=java.util.regex.Pattern.compile("[0-9]*");
        java.util.regex.Matcher match=pattern.matcher(tel.replaceAll(" ", ""));
        if(match.matches()==false)
        {
             return false;
        }
		return true;
	 }
	 
	 /**
	  * 读写文件 - sql load control
	  * @param request
	  * @param fileName
	  * @param tableName
	  */
	 public static boolean modifyFile(HttpServletRequest request,String fileName,String  tableName){
		 try {
			BufferedReader file1 = new BufferedReader(new FileReader(request.getSession().getServletContext().getRealPath("/resources/control_m.ctl")));
			BufferedWriter file2 = new BufferedWriter(new FileWriter(request.getSession().getServletContext().getRealPath("/resources/control.ctl")));
//			BufferedReader file1 = new BufferedReader(new FileReader("F:\\Soft\\apache-tomcat-6.0.37\\webapps\\xwwt_web\\resources\\control_m.ctl"));
//			BufferedWriter file2 = new BufferedWriter(new FileWriter("F:\\Soft\\apache-tomcat-6.0.37\\webapps\\xwwt_web\\resources\\control.ctl"));
			String s=null;
			while((s= file1.readLine())!=null){
				s= s.replace("TELPHONE", fileName).replace("TABLE", tableName);
				file2.write(s);
				file2.newLine();
			}
			file2.flush();
			file1.close();
			file2.close();
			return true;
		 } catch (Exception e) {
			e.printStackTrace(); 
		 }
		 return false;
	 }
	 
	 /**
	  * 生成二维码
	  * @param request
	  * @param url
	  * @param path
	  * @param nameCode
	  */
	 public static void createQrcode(HttpServletRequest request,String url,String path,String nameCode){
		 
		 Hashtable<EncodeHintType,Object> hints = new Hashtable<EncodeHintType,Object>(); 
	        //内容所使用编码 
	        hints.put(EncodeHintType.CHARACTER_SET, "utf-8"); 
			try {
				BitMatrix bitMatrix = new MultiFormatWriter().encode(url, 
				        BarcodeFormat.QR_CODE, 300, 300, hints);
				//生成二维码 
				String realPath = request.getSession().getServletContext().getRealPath(path);
				File fdir = new File(realPath);
				if(!fdir.exists()){
					fdir.mkdirs();
				}
		        File outputFile = new File(realPath+File.separator+nameCode+".jpg"); 
		        if(!outputFile.exists()){
		        	outputFile.createNewFile();
		        }
		        MatrixToImageWriterUtils.writeToFile(bitMatrix, "jpg", outputFile); 
			} catch (Exception e) {
				e.printStackTrace();
			} 
	 }
	 
	 public static String getURLLong2Short(String url, String aToken){
		 
//		 String aUrl = "http://221.178.251.156/xwwt/GETACCESSTOKEN";
//		 String aToken = HttpSendUtils.sendGet(aUrl);
		 System.out.println(" Current AccessToken = "+aToken);
		 
		 String sUrl = "https://api.weixin.qq.com/cgi-bin/shorturl?access_token="+aToken;
		 String param = "{\"action\":\"long2short\",\"long_url\":\""+url+"\"}";
		 String result = HttpSendUtils.sendPost(sUrl, param);
		 JSONObject jsonResult = JSONUtils.toJSONObject(result);
		 System.out.println(" long2short 返回结果：result = "+jsonResult.toString());
         String errcode=jsonResult.optString("errcode");
         if("0".equals(errcode)){
        	 return jsonResult.optString("short_url");
         }
		 return "";
	 }
	 
	 public static void main(String[] args) {
//		System.out.println(modifyFile(null,"1.txt","t_bt_test"));
//		 getURLShrotFromLong("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6a6a6ffbfdd886ec&redirect_uri="+URLEncoder.encode(HttpURL.WJDC_URL+"123")+"&response_type=code&scope=snsapi_base&state=12#wechat_redirect");
	}
}
