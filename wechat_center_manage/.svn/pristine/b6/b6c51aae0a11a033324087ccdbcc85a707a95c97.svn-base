<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file = "config.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>模板消息上传管理界面</title>
<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/main.js"></script>
<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
<body>
	   <div class="wxLayout">
    	  <table cellpadding="0" cellspacing="0">
				<tr >
					<td width="50%">
					   电话号码：
					</td>
					<td width="50%">
					   <input type="text"  id="phone"  placeholder="电话号码" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
                    <input id="sub" type="button" onclick="addlist()" value="确 定">
					</td>
				</tr>	
		</table>
   </div>
</body>
</html>
 <script>
    function addlist(){
		var phone = $("#phone").val();
		//发送验证码
		$.ajax({
			type:"post",
			url :"http://wx.xinyueapp.com/wxservice/index/templatemsg/addqxyh",
			data:{"phone":phone},
			dataType : "json",
			success:function(data){
			  if(data.success){
		         location.href="http://wx.xinyueapp.com/wxservice/index/templatemsg/templateuploadqxtj";  		
	    		}else{
	    		   alert("您好，您要添加的用户已经存在！");
	    		}
			}
		});
	}
   </script>
