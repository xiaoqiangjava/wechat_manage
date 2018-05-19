<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file = "config.jsp" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信模板消息测试电话号码添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"/></script>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/addtemplate.js"/></script>
	<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  	 <div class="wxLayout">
  	 	<div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->
            <a style="color:#86b801" href="index/templatemsg/findAllTestPhone">测试电话号码管理</a>-->测试电话号码修改
        </div>
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2"  style="font-size:28px;text-align:center">群 发消息测试电话号码修改</td>
            </tr>
            <tr>
                <td width="50%">电话号码</td>
                <td width="50%">
                    <input type="text" id="telphone" name="telphone" value="${templateTestPhone.telphone}">
                    <input type="hidden" id="telphoneid" name="telphoneid" value="${templateTestPhone.id}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="修改" onclick="updateTestPhone()">
                    <input type="button" value="返回" onclick="javascript:history.back();">
                </td>
            </tr>
        </table>
    </div>
  </body>
</html>
