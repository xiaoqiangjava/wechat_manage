    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<meta name="format-detection" content="telephone=no">
		<title>错误页面</title>
		<style type="text/css">
	        *{margin:0;padding:0;}
	        html body{background:#fff;font-size:14px;min-width:320px;max-width:640px; margin:0 auto; color:#666; line-height:1.5; font-family:"Segoe UI","Lucida Grande",Helvetica,Arial,"Microsoft YaHei",FreeSans,Arimo,"Droid Sans","wenquanyi micro hei","Hiragino Sans GB","Hiragino Sans GB W3","FontAwesome",sans-serif;}
	        ul,ol,li,dl,dt,dd{list-style:none;float:none;}
	        table{border:0;border-collapse:collapse;border-spacing:0;}
	        img{border:0;vertical-align:middle;}
	        a{text-decoration:none;}
	        em,i{font-style:normal;}
	        a{color:#666;}
	        body{font-family:"microsoft yahei","微软雅黑";}
	        .layoutBox{background:#fff;padding-top:9px;}
	        .layoutBox .mainImg{width:100%;}
	        .layoutBox .tipText{padding:0 20px;text-align:center;color:#787878;}
	    </style>
	</head>
	<body>
		<div class="layoutBox">
		    <img class="mainImg" src="${ctxStaticPre}/images/error_page_img.jpg" alt=""/>
		    <p class="tipText">
		    	<c:choose>
		    		<c:when test="${not empty errorMsg}">
		    			${errorMsg}
		    		</c:when>
		    		<c:otherwise>
		    			系统发生未知错误，请稍后再试！
		    		</c:otherwise>
		    	</c:choose>
		    </p>
		</div>
	</body>
</html>
