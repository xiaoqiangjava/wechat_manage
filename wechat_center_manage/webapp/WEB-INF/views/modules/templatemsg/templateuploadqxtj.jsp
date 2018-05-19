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
    	  <!-- <table width="20%" cellpadding="0" cellspacing="0">    
				<tr align="center" cellpadding="10" cellspacing="10">
					<td>
					   电话号码：
					<td>
					<td>
					   <input type="text"  id="phone"  placeholder="电话号码" />
					</td>
				</tr>
				<tr align="center" cellpadding="10" cellspacing="10">
					<td colspan="2" align="center">
					  <a href="javascript:void(0)" class="btn" id="sub" onclick="add()" style="margin-top: 5px">确定</a>
					<td>
				</tr>	
		</table> -->
		<table cellpadding="0" cellspacing="0">
            <tr>
                <td width="50%">
                   电话号码
                </td>
                <td width="50%">
                   操作
                </td>
            </tr>
            <c:forEach items="${qxyhList}" var="r">
                <tr>
                    <td>
                        ${r.telphone}
                    </td>
                    <td>
                      <a href="javascript:void(0)" class="btn" id="sub" onclick="deleteqxyh(${r.telphone})">删除</a>
                    </td>
                </tr>
            </c:forEach>
		</table>
        <div class="btnItem">
            <a href="javascript:;" onclick="add()" id="sub">添 加</a>
        </div>
   </div>
</body>
</html>
 <script>
    function add(){
	   location.href="http://wx.xinyueapp.com/wxservice/index/templatemsg/addtemplateuploadqxyh";  		
	}
	function deleteqxyh(phone){
		 $.ajax({
			type:"post",
			url:"http://wx.xinyueapp.com/wxservice/index/templatemsg/deletetemplate",
			data:{
			    "phone":phone,
				},
			dataType : "json",
			success:function(data){
				if(data.success){
			    	  location.href="http://wx.xinyueapp.com/wxservice/index/templatemsg/templateuploadqxtj";  
		   		  }else{
		   			  location.href="http://wx.xinyueapp.com/wxservice/index/templatemsg/templateuploadqxtj"; 
		   		  }
				
			}
		  
		});
	}
   </script>
