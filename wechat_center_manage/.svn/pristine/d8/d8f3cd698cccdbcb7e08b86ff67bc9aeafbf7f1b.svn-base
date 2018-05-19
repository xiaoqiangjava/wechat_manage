<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "config.jsp" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信群发消息模板模板管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"/></script>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/addtemplate.js"/></script>
	<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  	<div class="wxLayout">
  	    <div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->模板管理
        </div>
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="6">模板管理</td>
            </tr>
            <tr>
                <td width="25%">模板ID</td>
                <td width="15%">key值</td>
                <td width="20%">value值</td>
                <td width="20%">模板名称</td>
                <td width="20%" colspan="2">操作</td>
            </tr>
            <c:choose>
            <c:when test="${empty templateAllList}">
            <h3 style="color:red">还未添加任何消息模板</h3>
            </c:when>
            <c:otherwise>
            <c:forEach items="${templateAllList}" var="str" varStatus="status">
            <tr>
                <td>${str.templateid}</td>
                <td>${str.sendMsgkey}</td>
                <td>${str.sendMsgvalue}</td>
                <td>${str.templatename}</td>
                <td><a class="btn" href="index/templatemsg/getByIdForTemplate?id=${str.id}">修改</a></td>
                <td><a class="btn" href="javascript:void(0);" onclick="deleteByIdTemplate(${str.id})">删除</a></td>
            </tr>
            </c:forEach>
            </c:otherwise>
            </c:choose>
        </table>
    </div>
  </body>
</html>
