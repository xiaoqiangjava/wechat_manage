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
<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
<body>
   <div class="wxLayout">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td width="50%">
                   <input type="text" id="phone" class="icInput" placeholder="手机号码"/>
                </td>
                <td width="50%"></td>
            </tr>
            <tr>
                <td>
                   <input type="text"  id="yzm"  placeholder="验证码" />
                </td>
                <td>
                   <a class="btn" href="#" onclick="Btnlink();">获取短信验证码</a>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" id="sub" value="确 定" onclick="buys()">
                </td>
            </tr>
        </table>
        <div class="btnItem">
            <a href="javascript:;" onclick="addYh()" id="sub">查看所有用户页面</a>
        </div>
    </div>
</body>
</html>
 <script>
var buyController = "true";
var countdown="";
var count = 0;
function buys(){
	var phone = document.getElementById("phone").value;
	var yzm = document.getElementById("yzm").value;
	if(yzm == ""){
		alert("请输入验证码");
		return;
	}
	if(phone == ""){
		alert("请输入手机号");
		return;
	}
	$.ajax({
		type:"post",
		url:"http://wx.xinyueapp.com/wxservice/index/templatemsg/uploadtemplate",
		data:{
		    "phone":phone,
		    "yzm":yzm,
			},
		dataType : "json",
		success:function(data){
			if(data.success){
		    	  location.href="http://wx.xinyueapp.com/wxservice/index/templatemsg/mainmanager";  
	   		  }else{
	   			  location.href="http://wx.xinyueapp.com/wxservice/index/templatemsg/uploadtemplate"; 
	   		  }
			
		}
	  
	});
	}
	
	
function Btnlink(){
	//window.location.href = "./llhb";
	$("#yzm").val("");
	if(buyController == "false"){
		return;
	}
	//验证手机号
	var phone = $("#phone").val();
	if(!checkMobile(phone)){
		alert("请填写正确的手机号！");
		return;
	}
	
	//$(".gmll .BtnGetcode a").attr("onclick","");
	count = 60;
	countdown = setInterval(CountDown, 1000);
	buyController = "false";
	//发送验证码
	$.ajax({
		type:"post",
		url :"http://wx.xinyueapp.com/wxservice/index/templatemsg/sendMsg",
		data:{"phone":phone},
		dataType : "json",
		success:function(data){
				alert("验证码已发送！");
		}
	});
	}
	
	//验证手机号
function checkMobile(sMobile){ 
	 if(!(/^0?1[3|4|5|8][0-9]\d{8}$/.test(sMobile))){ 
		 return false; 
	 }else{
		 return true;
	 }
} 

function CountDown() {
        $(".gmll .BtnGetcode a").text("重新发送( " + count + " )").css("color","#d0d0d0");
        if (count == 0) {
        	$(".gmll .BtnGetcode a").attr("onclick","Btnlink()");
            $(".gmll .BtnGetcode a").text("获取验证码").css("color","#222");
            clearInterval(countdown);
        }
        count--;
    }
    
function addYh(){
	   location.href="http://wx.xinyueapp.com/wxservice/index/templatemsg/templateuploadqxtj";  		
	}
	
   </script>

