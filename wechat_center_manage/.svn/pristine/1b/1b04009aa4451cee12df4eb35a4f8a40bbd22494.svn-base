<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "config.jsp" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信群发消息模板测试电话号码管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"/></script>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/addtemplate.js"/></script>
	<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div class="wxLayout">
        <div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->测试电话号码管理
        </div>
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="4"  style="font-size:28px;">测试电话号码管理</td>
            </tr>
            <tr>
                <td>序号</td>
                <td>电话号码</td>
                <td colspan="2">操作</td>
            </tr>
            <c:choose>
            <c:when test="${empty phoneList}">
            <h3 style="color:red">还未添加任何测试电话号码</h3>
            </c:when>
            <c:otherwise>
            <c:forEach items="${phoneList}" var="str" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${str.telphone}</td>
                <td><a class="btn" href="index/templatemsg/getByIdForTestPhone?id=${str.id}">修改</a></td>
                <td><a class="btn" href="javascript:void(0);" onclick="deleteTestPhone(${str.id})">删除</a></td>
            </tr>
            </c:forEach>
            </c:otherwise>
            </c:choose>
        </table>
        <div class="btnItem">
            <a href="index/templatemsg/addTestPhoneTo">添加新的测试电话号码</a>
        </div>
    </div>
  </body>
</html>
