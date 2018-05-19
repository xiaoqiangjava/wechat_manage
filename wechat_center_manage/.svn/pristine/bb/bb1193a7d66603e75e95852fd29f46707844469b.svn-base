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
<script type="text/javascript" src="<%=urlPath %>resources/scripts/templatemsg/main.js"></script>
<link href="<%=urlPath %>resources/css/templatemsg/wxqf.css" rel="stylesheet" type="text/css" />
<body>
   <div class="wxLayout">
        <div style="width:100%; text-align:left;margin-top:20px;margin-bottom:20px;">
            当前位置:&nbsp;&nbsp;<a style="color:#86b801" href="index/templatemsg/mainmanager">首页</a>-->上传发送电话号码
        </div>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <input type="file" id="file" name="file"><br/>
                    <input type="hidden" id="flag" name="flag" value="ajax文件上传"/>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="sub" value="导 入" onclick="upload()">
                </td>
            </tr>
        </table>
   </div>
</body>
</html>
 <script>
      function upload() {   
		 var s = document.getElementById("file").value;
		 var str = s.substr(s.length-3,3);
		if(str == null || (str != "csv" && str != "CSV" ))
		{
		    alert("请选择格式为csv文件！","【系统提醒】 ");
			return;
		}
		 var data = new FormData();
		 $.each($('#file')[0].files, function(i, file) {
		 	  	 data.append('file', file);
		    });
		 $("#sub").val("导入中...");
		   $.ajax({
		    	  url:"/xwwt_web/index/templatemsg/upload",
		          type:'POST', 
		    	  data:data,
		    	  cache: false,
		    	  contentType: false,    //不可缺
		    	  processData: false,    //不可缺
		    	  success:function(data){
		 $("#sub").val("导入");
		    		  if(data.success){
                                            alert("上传成功");
		    			  //var url = data.imgurl;
		    			  //$("#pfigureurl").val(url);
		    			  //$("#newspicurl").html('<img width="140" height="140" src="${pageContext.servletContext.contextPath }'+url+'" />');
		    		  }else{
		    			  alert("上传失败");
		    		  }
		    	  }
		      });
    }
   </script>
