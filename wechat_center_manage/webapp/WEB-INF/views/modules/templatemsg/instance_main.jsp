<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file = "config.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信模板消息推送主页管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	 <div class="wxLayout">
      <div class="wxList">
            <a href="index/templatemsg/findAllTestPhone">测试电话号码管理</a><br/>
            <a href="index/templatemsg/addInstance">添加模板</a><br/>
            <a href="index/templatemsg/instances">模板消息管理</a><br/>
            <a href="index/templatemsg/sendTemplateMsg">推送消息</a><br/>
            <a href="index/templatemsg/templateupload">上传发送电话号码</a><br/>
            
      </div>
  </div>
  </body>
</html>
