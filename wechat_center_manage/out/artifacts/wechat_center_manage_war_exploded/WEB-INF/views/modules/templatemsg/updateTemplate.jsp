<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "config.jsp" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信模板消息修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"/></script>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/addtemplate.js"/></script>
  </head>
  
  <body>
  <div class="wxLayout">
  <div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->添加模板
        </div>
 <table cellspacing="0" cellpadding="0" >
  <tr>
  	<td colspan="4"  style="font-size:28px;text-align:center">群发消息模板消息修改</td>
  </tr>
  <tr>
  	<td style="text-align:center;font-size:16px">模板ID</td>
  	<td style="width:50%;height:40px;text-align:center;font-size:16px">
  	<input type="text" id="templateid" name="templateid" value="${tempMsgBean.templateid}">
  	<input type="hidden" id="tempid" name="tempid" value="${tempMsgBean.id}">
  	</td>
  </tr>
  <tr>
  	<td style="text-align:center;font-size:16px">key值</td>
  	<td style="width:50%;height:40px;text-align:center;font-size:16px">
  	<input type="text" id="sendMsgkey" name="sendMsgkey" value="${tempMsgBean.sendMsgkey}">
  	<input type="hidden" id="tempid" name="tempid" value="${tempMsgBean.id}">
  	</td>
  </tr>
   <tr>
  	<td style="text-align:center;font-size:16px">value值</td>
  	<td style="width:50%;height:40px;text-align:center;font-size:16px">
  	<input type="text" id="sendMsgvalue" name="sendMsgvalue" value="${tempMsgBean.sendMsgvalue}">
  	<input type="hidden" id="tempid" name="tempid" value="${tempMsgBean.id}">
  	</td>
  </tr>
   <tr>
  	<td style="text-align:center;font-size:16px">模板名称</td>
  	<td style="width:50%;height:40px;text-align:center;font-size:16px">
  	<input type="text" id="templatename" name="templatename" value="${tempMsgBean.templatename}">
  	<input type="hidden" id="tempid" name="tempid" value="${tempMsgBean.id}">
  	</td>
  </tr>
  <tr>
  <td colspan="4" style="width:50%;height:40px;text-align:center;font-size:16px">
  <input type="button" value="修改" onclick="updateTemplate()">
  </td>
  </tr>
   </table>
  </div>
  </body>
</html>
