<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>我的沈阳微信公众号|公众号管理</title>
	<link href="<c:url value="/images/global.css"/>" rel="stylesheet"
		type="text/css" />
	<link href="<c:url value="/images/index_ht.css"/>" rel="stylesheet"
		type="text/css" />
	<link href="<c:url value="/styles/style.css"/>" rel="stylesheet"
		type="text/css" />
	<link href="<c:url value="/images/index.css"/>" rel="stylesheet" type="text/css"></link>
	<script type="text/javascript"
		src="<c:url value="/images/jquery.min.js"/>"></script>
	<style type="text/css">
.header .header_r .j1 {
	color: #666;
	background-image: none;
	background-color: #f2f2f2;
}

.tips {
	position: relative;
	z-index: 2;
}

.tips:hover {
	z-index: 3;
	background: none;
}

.tips span {
	display: none;
	position: absolute;
	top: 25px;
	left: 5px;
	width: 350px;
	border: 1px solid #5B9CDB;
	background-color: #5B9CDB;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
	border-radius: 6px;
	padding: 6px 6px 4px 6px;
	font-size: 12px;
	line-height: 18px;
	color: #fff;
	text-align: left;
}

.tips:hover span {
	display: block;
}

.tips span:before {
	content: "";
	width: 0;
	height: 0;
	position: absolute;
	bottom: 100%;
	left: 10px;
	border-width: 0 8px 8px 8px;
	border-style: solid;
	border-color: #5B9CDB transparent;
}

.tips span:after {
	content: "";
	width: 0;
	height: 0;
	position: absolute;
	bottom: 100%;
	left: 12px;
	border-width: 0 6px 6px 6px;
	border-style: solid;
	border-color: #5B9CDB transparent;
}

.wirt_text1200 a {
	padding: 5px 25px 4px;
	text-decoration: none;
}

.wirt_text1200 .curs {
	border-radius: 20px;
	padding: 5px 25px 4px;
	text-decoration: none;
}

.wirt_text1200 a:hover {
	border-radius: 20px;
	padding: 5px 25px 4px;
	text-decoration: none;
}
</style>
<link rel="stylesheet" type="text/css"
			href="<c:url value="/images/base1eec8c.css"/>" />
</head>

<body>
	<!-- head start -->
<div class="bg">
	<div class="wirt_bg"></div>
	<div class="wirt_text">
		<div class="wirt_text1200">
			<a href="<c:url value="/admin"/>">首页</a>
			<a href="<c:url value="/publicInfo/addPublicInfo"/>">添加微信公众号</a> 
			<!--<a href="#"  class="curs">个人资料</a>-->
			<span style="float: right">您好：<strong>${loginUser.useraccount}</strong>
			<a href="<c:url value="/index/loginOut"/>" >退出</a></span>
<style>
#show_span {color: red;	margin-left: 10px;}
.soqilai {	position: absolute;	bottom: -14px;	left: 445px;cursor: pointer;}
/** 微信信息 **/
.wei_pop {left: 40px;	position: absolute;	top: 10px;z-index: 999;}
.line_other {width: 90%;margin: 0 0 0 5%;}
.use100 .ml130 {margin: 0 0 0 130px;}
</style>
		</div>
	</div>
	<div class="use">
		<div class="use1200  use100">
			<!--<div class="txz1">
				<span
					style="line-height: 27px; color: rgb(255, 255, 255); font-size: 19px; margin-left: 52px;"></span>
			</div>
			--><div class="wei_pop">
				<a class="tips"> 
				<c:if test="${empty pinfo.pfigureurl}">
					<img src="<c:url value="/images/default_head_img.jpg"/>" style="border: 1px solid #e4e4e4; border-radius: 50%; height: 85px; width: 85px;" />
				</c:if>
				<c:if test="${!empty pinfo.pfigureurl}">
					<img src="<c:url value="${pinfo.pfigureurl}"/>" style="border: 1px solid #e4e4e4; border-radius: 50%; height: 85px; width: 85px;" />
				</c:if>
				</a>
			</div>
			<div class="line line_other"></div>
			<div class="use_t ml130">
				公众账号名称：<font class="names">${pinfo.pname}</font>
			</div>
			<div class="use_b ml130">
				<span class="email" style="border: none">微信号：${pinfo.paccount} <img
					src="<c:url value="/images/use_ico.png"/>" width="16" height="16" /></span>
			</div>

		</div>
	</div>
</div>
<style>
.use_h {margin: 0;}
.use_h_l {margin: 65px 0;}
.use_h_r p {display: block;height: 0;margin: 0 0 30px;}
.use_h_r {float: left;margin: 10px 0 0 12px;}
.use_h_l img:hover {border: 1px solid #5B9CDB;}
.use_h_l>span {left: 45px;top: 242px;width: 101px;}
</style>
	<!-- head end -->
	
	<div class="gonggao" style="height: 950px;">
		<div class="pbox">
			<!-- 公众号功能菜单 -->
			<jsp:include page="../../../common/common_menu.jsp" />
			<div class="col_main">
				<h2>
					<span><img class="home_tips"
						src="<c:url value="/images/p6.jpg"/>" /></span> 当前位置：公众号信息
				</h2>
				<div class="formWp">
					<form action=""
						method="post" id="saveForm">
						<input type="hidden" name="pname" value="${pinfo.pname}"/>
						<table>
						<tr>
								<th>
									AppID：
								</th>
								<td>
									${pinfo.pappid}
								</td>
								<th rowspan="3">头像：</th>
								<td rowspan="3"><div  id="newspicurl" class="use_h_l" style="margin:0 ">
								  <c:if test="${pinfo.pfigureurl == 'null' || empty pinfo.pfigureurl}">
						          	<img width="140" height="140" src="<c:url value="/images/default_head_img.jpg"/>" />
						          </c:if>
						          <c:if test="${!empty pinfo.pfigureurl && pinfo.pfigureurl != 'null'}">
						          	<img width="140" height="140" src="<c:url value="${pinfo.pfigureurl}"/>" />
						          </c:if>
								</div></td>
							</tr>
							<tr>
								<th>
									AppSecret：
								</th>
								<td>
									${pinfo.psecret}
								</td>
							</tr>
							<tr>
								<th>
									微信号：
								</th>
								<td>
									${pinfo.paccount}
								</td>
							</tr>
							<tr>
								<th>
									公众号名称：
								</th>
								<td>
									${pinfo.pname}
								</td>
							</tr>
							<tr>
								<th>
									公众号原始ID：
								</th>
								<td>
									<input class="px" type="text" id="pid" name="pid" value="${pinfo.pid}" />
									<span id="show_span">*</span>
								</td>
							</tr>
							<tr>
								<th>
									头像：
								</th>
								<td>
									<input type="hidden" name="pfigureurl" id="pfigureurl" value="${pinfo.pfigureurl }" />
									<input class="px" type="file" name="pfigureurl_img" id="pfigureurl_img" /> 
									<span class="btnwrap btnpositive"> <a height="32"
										width="106" id="submitButton" style="padding-top:1px;padding-bottom: 2px"
										class="btn btn_primary" onclick="doUploadPic()" >上传预览</a>
									</span>
								</td>
							</tr>
							<tr>
								<th>公众号类型：</th>
								<td>
									<label><input type="radio" name="ptype" value="0" ${pinfo.ptype eq '0' ?'checked="checked"':'' } /> 订阅号</label> &nbsp;&emsp;
									<label><input type="radio" name="ptype" value="1" ${pinfo.ptype eq '1' ?'checked="checked"':'' } /> 服务号</label>
								</td>
							</tr>
							<tr>
								<th>是否认证：</th>
								<td>
									<label><input type="radio" name="pcertype" value="0" ${pinfo.pcertype eq '0' ?'checked="checked"':'' } /> 已认证</label> &nbsp;&emsp;
									<label><input type="radio" name="pcertype" value="1" ${pinfo.pcertype eq '1' ?'checked="checked"':'' } /> 未认证</label>
								</td>
							</tr>
							<tr>
								<th>
									公众号简介：
								</th>
								<td>
									<textarea name="pintroducecontent"
										style="width: 450px; height: 100px;">${pinfo.pintroducecontent }</textarea>
								</td>
							</tr>
							<tr>
								<th>
									企业信息简介：
								</th>
								<td>
									<textarea name="premark"
										style="width: 450px; height: 100px;">${pinfo.premark }</textarea>
								</td>
							</tr>
							<tr>
								<th height="80px"></th>
								<td>
									<span class="btnwrap btnpositive"> <a height="32"
										width="106" id="saveReplyInfoButton" style="padding-top:2px;padding-bottom: 3px"
										class="btn btn_primary saveReplyInfoButton"
										onclick="do_check_data();">修改公众号</a> </span> &emsp;
									<span class="btnwrap btnpositive"> <a height="32"
										width="106" id="submitButton" style="padding-top:2px;padding-bottom: 3px"
										onclick="return do_reset_data();" class="btn btn_primary">重填</a>
									</span> &emsp;
									<span id="message" style="color: red; line-height: 30px;"></span>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>

	<!-- Page Foot Start -->
	<jsp:include page="../../../common/common_foot.jsp" />
	<!-- Page Foot End  -->

	<script type="text/javascript">
function do_check_data(){
	$("#message").html("");
	//$("#saveForm").submit();
	//var formData = $("#saveForm").serialize();
	$.ajax({
		url : '<c:url value="/publicInfo/syncModifyPublicInfo"/>',
		type:'get',
		data: $("#saveForm").serialize(),
		success:function(data){
			if(data.success){
				$("#message").html("修改成功");
			}	
		}
	});
}

function doUploadPic(){
	var filePath = $("#pfigureurl_img").val();
	
   	if(filePath ==""){
		alert("请选择图片"); return ;
	}
	var strExtension = (filePath.substring(filePath.lastIndexOf('.') + 1)).toLowerCase();
	if(strExtension != 'jpg' && strExtension != 'jpeg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {  
	   alert("请选择图片文件(jpg,jpeg,gif,png,bmp)");  return;  
    }else{
		//异步上传
		 var data = new FormData();
		   $.each($('#pfigureurl_img')[0].files, function(i, file) {
		 	  	 data.append('file', file);
		    });
		   $.ajax({
		    	  url:"<c:url value='/publicInfo/syncUploadPic'/>",
		          type:'POST', 
		    	  data:data,
		    	  cache: false,
		    	  contentType: false,    //不可缺
		    	  processData: false,    //不可缺
		    	  success:function(data){
		    		  if(data.success){
		    			  var url = data.imgurl;
		    			  $("#pfigureurl").val(url);
		    			  $("#newspicurl").html('<img width="140" height="140" src="${pageContext.servletContext.contextPath }'+url+'" />');
		    		  }else{
		    			  alert("上传失败");
		    		  }
		    	  }
		      });
	}
}
</script>
</body>

</html>
