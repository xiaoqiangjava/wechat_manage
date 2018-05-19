<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file = "config.jsp" %>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>微信群发消息添加模板</title>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/jquery-1.7.2.min.js"/></script>
	<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/addtemplate.js"/></script>
	<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		function save(){
			var templateid = $("#templateid").val();
			var title = $("#title").val();
			//var url = $("#url").val();
			
			if(templateid==""){
				alert("模板id不能为空","【系统提醒】 ");
				return false;
			}
			
			if(title==""){
				alert("模板名称不能为空","【系统提醒】 ");
				return false;
			}
			
			/* if(url==""){
				alert("链接地址不能为空","【系统提醒】 ");
				return false;
			} */
			
			document.instanceForm.submit();
		}
	</script>
  </head>
  
  <body>
  <div class="wxLayout">
  	  <div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->群发消息模板添加
        </div>
       <form name="instanceForm" action="${fromAction}" method="post">
      <table cellspacing="0" cellpadding="0" >
      	  <c:if test="${!empty opr and opr=='edit'}">
      	  <input type="hidden" id="id" name="id" value="${templateMsgIns.id}">
      	  </c:if>
          <tr>
            <td colspan="2"  style="font-size:28px;text-align:center">群发消息模板添加</td>
          </tr>
          <tr>
            <td width="20%">模板ID</td>
            <td width="80%"><input type="text" id="templateid" name="templateid" size="200" value="${templateMsgIns.templateid}"></td>
          </tr>
          <tr>
            <td>模板名称</td>
            <td><input type="text" id="title" name="title" size="200" value="${templateMsgIns.title}"></td>
          </tr>
          <!--  
          <tr>
            <td>链接地址</td>
            <td><input type="text" id="url" name="url" value="${templateMsgIns.url}"></td>
          </tr>
          -->
          <tr>
            <td>first值</td>
            <td><input type="text" id="first" name="first" value="${templateMsgIns.first}"></td>
          </tr>
          <tr>
            <td>keyword1值</td>
            <td><input type="text" id="keyword1" name="keyword1" value="${templateMsgIns.keyword1}"></td>
          </tr>
          <tr>
            <td>keyword2值</td>
            <td><input type="text" id="keyword2" name="keyword2" value="${templateMsgIns.keyword2}"></td>
          </tr>
          <tr>
            <td>keyword3值</td>
            <td><input type="text" id="keyword3" name="keyword3" value="${templateMsgIns.keyword3}"></td>
          </tr>
          <tr>
            <td>keyword4值</td>
            <td><input type="text" id="keyword4" name="keyword4" value="${templateMsgIns.keyword4}"></td>
          </tr>
          <tr>
            <td>remark值</td>
            <td><input type="text" id="remark" name="remark" value="${templateMsgIns.remark}"></td>
          </tr>
          <tr>
          <td colspan="2">
            <input type="button" value="保存" onclick="save();">
            <input type="button" value="返回" onclick="history.back();">
          </td>
          </tr>
      </table>
      </form>
  </div>
  </body>
</html>
