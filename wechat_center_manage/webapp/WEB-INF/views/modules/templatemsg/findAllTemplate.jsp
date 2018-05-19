<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "config.jsp" %>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>微信群发消息模板显示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"/></script>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/sendTemplateMessage.js"/></script>
	<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  	<div class="wxLayout">
  	<div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->推送消息
        </div>
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td width="50%">模板类型</td>
                <td width="50%">
                <c:choose>
                <c:when test="${empty templateList}">
                <select name="template" id="template" style="color:red;margin-bottom:10px;">
                <option value="-1" >还未添加模板</option>
                </select>
                </c:when>
                <c:otherwise>
                <select name="template" id="template">
                <c:forEach items="${templateList}" var="str">
                   <option value="${str.templateid}">${str.templatename}</option>
                </c:forEach>
                </select>
                </c:otherwise>
                </c:choose>
                </td>
            </tr>
            <tr >
            <td> <input id="formalMsgBtn" type="button" onclick="sendTemplateFormalMsg()" value="正式发送"/></td>
            <td> <input id="testMsgBtn" type="button" onclick="sendTemplateTestMsg()" value="测试用户发送"/></td>
            </tr>
        </table>
    </div>
  </body>
</html>
