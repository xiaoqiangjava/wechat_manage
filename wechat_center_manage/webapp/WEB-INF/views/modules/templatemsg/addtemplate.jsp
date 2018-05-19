<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file = "config.jsp" %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信群发消息添加模板</title>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"/></script>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/addtemplate.js"/></script>
	<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  <div class="wxLayout">
  	  <div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->群发消息模板添加
        </div>
      <table cellspacing="0" cellpadding="0" >
          <tr>
            <td colspan="2"  style="font-size:28px;text-align:center">群发消息模板添加</td>
          </tr>
          <tr>
            <td width="50%">模板ID</td>
            <td width="50%"><input type="text" id="templateid" name="templateid" ></td>
          </tr>
          <tr>
            <td>发送消息key值</td>
            <td><input type="text" id="templatekey" name="templatekey" ></td>
          </tr>
          <tr>
            <td>发送消息value值</td>
            <td><input type="text" id="templatevalue" name="templatevalue" ></td>
          </tr>
          <tr>
            <td>模板名称</td>
            <td><input type="text" id="templatename" name="templatename" ></td>
          </tr>
          <tr>
          <td colspan="2">
            <input type="button" value="添加" onclick="saveTemplate()">
          </td>
          </tr>
      </table>
  </div>
  </body>
</html>
