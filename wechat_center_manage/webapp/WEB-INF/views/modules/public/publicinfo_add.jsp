<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>我的沈阳微信公众号|公众号管理</title>
		<link href="<c:url value="/images/global.css"/>" rel="stylesheet"
			type="text/css" />
		<link href="<c:url value="/images/index_ht.css"/>" rel="stylesheet"
			type="text/css" />
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
#show_span {
	color: red;
	margin-left: 10px;
}
.use_b a:hover {
	text-decoration: none;
}
</style>
		<link rel="stylesheet" type="text/css"
			href="<c:url value="/images/base1eec8c.css"/>" />
	</head>
	<body>
		<script>
</script>
		<div class="bg">
			<div class="wirt_bg"></div>
			<div class="wirt_text">
				<div class="wirt_text1200">
					<a href="<c:url value="/admin"/>">首页</a>
					<a href="<c:url value="/publicInfo/addPublicInfo"/>" class="curs">添加微信公众号</a>
					<!--<a href="#">个人资料</a>
          -->
					<!-- <span id="show_span">提醒：</span> -->
				</div>
			</div>
			<div class="use">
				<div class="use1200">

					<%-- <div class="gonggao nl" id="cz1" style="height: 0px; bottom: -0.003010219439147477px; margin-top: 0px; position: absolute; z-index: 9999; width: 960px; left: 120px;">
    <div class="g_l" style="width:100%; position:relative; height:300px;">
          <div class="soqilai">
          <img src="<c:url value="/images/s.png"/>" />
          </div>
          <div class="box2">
        <p class="hui">公告</p>
		 <p style="display:none;width:100%;color: red;font-size: 18px;" class="cz"> 		
		 【300w回馈】 一年仅一次！ 微小信年中——反馈日 <br> 		
		 6.17-6.20期间开通包年会员的只要【600】，[还送2个月]<br> 		
		 ***代理平台优惠:充值金币*2;充值10000,【变20000金币】;充20000,【变40000金币】;<br>
        </p>		
        <p class="cz" style="width:100%;color: #FFA500;font-size: 15px;"> 为了答谢广大用户一直以来对微小信的支持，在微小信创立500天之际，推出以下反馈业务：<br>
              ★★★★★ 1.新注册用户，可以使用平台【所有功能】试用3天，基本功能【永久免费】！<br>
              ★★★★★ 2.老用户，没有开通过行业模块的，可以点击后台开通未开通的行业模块【试用3天】体验！<br>
            </p>
        <p class="hui">实用工具--可以将以下地址做文章外链使用</p>
        <p class="cz" style="width:100%;color: #FFA500;font-size: 15px;"> <a href="http://wap.weixiaoxin.com/Tools/index/" target="_blank">&gt;&gt;生活百事通-http://wap.weixiaoxin.com/Tools/index/</a><br>
              <a href="http://www.faqiba.com/" target="_blank">&gt;&gt;发起吧！-最新信息助手-faqiba.com</a><br>
            </p>
      </div>
        </div>
  </div> 
         <div class="txz1">
	 <span style="line-height: 27px; color: rgb(255, 255, 255); font-size: 19px; margin-left: 52px;"></span>
      	</div>	 --%>
					<div class="line"></div>
					<div class="use_t">
						您好，${loginUser.useraccount}
						<em>欢迎使用微信公众号</em>
						<em><a href="<c:url value="/index/loginOut"/>"
							style="color: #fff">退出</a>
						</em>
					</div>
					<div class="use_b">
						<span class="email" style="">手机号： ${loginUser.userphone}<img
								src="<c:url value="/images/use_ico.png"/>" width="16"
								height="16" />
						</span>
						<!--<span style="padding-left: 20px">上次登录时间:2014-09-17 15:41:41</span>
					--></div>
				</div>
			</div>
		</div>
		<style>
.use_h {
	margin: 0;
}

.use_h_l {
	margin: 65px 0;
}

.use_h_r p {
	display: block;
	height: 0;
	margin: 0 0 30px;
}

.use_h_r {
	float: left;
	margin: 10px 0 0 12px;
}

.g_r p {
	height: 16px;
	line-height: 26px;
	margin: 10px 0 0;
}

.g_list li {
	color: #666666;
	height: 100%;
	width: 95%;
	line-height: 23px;
	height: 23px;
	overflow: hidden;
	border-bottom: dashed 1px #CCC;
}
</style>
		<style>
.g_list {
	overflow: hidden;
	position: relative;
	top: 5px;
}

.zh_block {
	background-color: #FFFFFF;
	border: 1px solid #CCCCCC;
	float: left;
	height: 270px;
	margin: 0 -1px -1px 0;
	position: relative;
	width: 100%;
}

.use_h_l img:hover {
	border: 1px solid #5B9CDB;
}

.use_h_l>span {
	left: 45px;
	top: 242px;
	width: 101px;
}

.open_try {
	color: #F57403;
}
</style>
		<style>
.gn_l {
	float: left;
	overflow: hidden;
	margin: 65px 10px 0 0;
}

.gn_l a {
	padding: 3px 8px;
	background-color: #028fde;
	margin: 5px 0;
	font-size: 16px;
	color: #FFF;
}

.gn_l p {
	overflow: hidden;
	height: auto;
	margin: 0;
}

.gn_m {
	width: 530px;
	margin: 0 0 0 20px;
	overflow: hidden;
	float: left;
}

.gn_m li {
	float: left;
	width: 260px;
	margin: 5px 0;
}

.usez_ico {
	float: left;
	width: 50px;
	margin: 0 10px 0 0;
}

.usez_text {
	float: left;
	width: 190px;
}

.usez_text h2 {
	background: none;
	padding: 0;
}

.usez_text p {
	margin: 5px 0;
	overflow: hidden;
	height: auto;
}

.zh_block {
	height: 350px;
}

.zh_block:hover {
	background-color: #FFF;
}

.gn_r {
	float: left;
	border-left: solid 1px #e2e2e2;
	padding: 0 0 0 30px;
	width: 320px;
}

.gn_r h2 {
	background: none;
	padding: 0;
}

.gn_r p {
	border-bottom: solid 1px #efefef;
	height: 36px;
	line-height: 36px;
	margin: 0;
}

.tongji {
	width: 150px;
	float: left;
}

.gn_m {
	width: 570px;
	margin: 0 0 0 20px;
	overflow: hidden;
	float: left;
}

.usez_text {
	float: left;
	width: 224px;
}

.gn_m li {
	float: left;
	width: 285px;
	margin: 5px 0;
}

.gn_r {
	float: left;
	border-left: solid 1px #e2e2e2;
	padding: 0 0 0 30px;
	width: 286px;
}

.tongji {
	width: 138px;
	float: left;
}

.use_h_r a {
	background-color: #028fde;
	color: #FFFFFF;
}
</style>
		<style>
.zh_block3 {
	background-color: #ffffff;
	border: 1px solid #cccccc;
	float: left;
	margin: 0 -1px -1px 0;
	position: relative;
	height: 105px;
	width: 315px;
}

.g_l2 {
	width: 360px;
}

.add_pic {
	top: 29px;
}

.add_text {
	top: 25px;
	COLOR: #FFFFFF;
}

.a_block {
	display: block;
	height: 105px;
	background-color: #5b9cdb;
	width: 315px;
}

.g_l2 {
	border-right: 1px solid #ccc;
	float: left;
	width: 360px;
	height: 135px;
}

.zh_block:hover {
	background-color: #f1f1f1;
	border: 1px solid #028fde;
}

.formWp input[name="text"]{padding-left: 5px;}
.formWp textarea{padding: 5px;}
</style>
		<div class="gonggao" style="height: 100%;">
			<div class="pbox">
				<div class="formWp">
					<form action="<c:url value="/publicInfo/savePublicInfo"/>"
						method="post" id="saveForm" name="savePublicInfoForm">
						<table>
							<tr>
								<th></th>
							</tr>
							<tr>
								<th>
									AppID：
								</th>
								<td>
									<input class="px" type="text" id="pappid" name="pappid"
										value="" />
									<span id="show_span">(* 请务必填写正确)</span>
								</td>
								<th rowspan="3">头像：</th>
								<td rowspan="3"><div  id="newspicurl" class="use_h_l" style="margin:0 ">
								<img width="140" height="140" title="默认头像" src="<c:url value="/images/default_head_img.jpg"/>" />
								</div></td>
							</tr>
							<tr>
								<th>
									AppSecret：
								</th>
								<td>
									<input class="px" type="text" id="psecret" name="psecret"
										value="" />
									<span id="show_span">(* 请务必填写正确)</span>
								</td>
							</tr>
							<tr>
								<th>
									微信号：
								</th>
								<td>
									<input class="px" type="text" id="paccount" name="paccount" />
									<span id="show_span">*</span>
								</td>
							</tr>
							<tr>
								<th>
									公众号名称：
								</th>
								<td>
									<input class="px" type="text" id="pname" name="pname" value="" onblur="do_check_publicname(this)" />
									<span id="show_span">*</span>
									<span id="message_pubicname" style="color:red"></span>
								</td>
							</tr>
							<tr>
								<th>
									公众号原始ID：
								</th>
								<td>
									<input class="px" type="text" id="pid" name="pid" />
									<span id="show_span">*</span>
								</td>
							</tr>
							<tr>
								<th>
									头像：
								</th>
								<td>
									<input type="hidden" name="pfigureurl" id="pfigureurl" />
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
									<label><input type="radio" name="ptype" value="0" checked="checked" /> 订阅号</label> &nbsp;&emsp;
									<label><input type="radio" name="ptype" value="1" /> 服务号</label>
								</td>
							</tr>
							<tr>
								<th>是否认证：</th>
								<td>
									<label><input type="radio" name="pcertype" value="0" checked="checked" /> 已认证</label> &nbsp;&emsp;
									<label><input type="radio" name="pcertype" value="1" /> 未认证</label>
								</td>
							</tr>
							<tr>
								<th>
									公众号简介：
								</th>
								<td>
									<textarea name="pintroducecontent"
										style="width: 450px; height: 100px;"></textarea>
								</td>
							</tr>
							<tr>
								<th>
									企业信息简介：
								</th>
								<td>
									<textarea name="premark"
										style="width: 450px; height: 100px;"></textarea>
								</td>
							</tr>
							<tr>
								<th height="80px"></th>
								<td>
									<span class="btnwrap btnpositive"> <a height="32"
										width="106" id="saveReplyInfoButton" style="padding-top:2px;padding-bottom: 3px"
										class="btn btn_primary saveReplyInfoButton"
										onclick="do_check_data();">添加公众号</a> </span> &emsp;
									<span class="btnwrap btnpositive"> <a height="32"
										width="106" id="submitButton" style="padding-top:2px;padding-bottom: 3px"
										onclick="savePublicInfoForm.reset()" class="btn btn_primary">重填</a>
									</span> &emsp;
									<span id="message" style="color: red; line-height: 30px;"></span>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div style="clear: both;">
		</div>
<style>
.footer {
	margin: 20px 0 0 0;
}
</style>
		<link href="<c:url value="/images/index.css"/>" rel="stylesheet" type="text/css" />

		<!-- Page Foot Start -->
		<jsp:include page="../../../common/common_foot.jsp" />
		<!-- Page Foot End  -->


<script type="text/javascript">
function do_check_data(){

	var pappid = $("#pappid").val();
	if($.trim(pappid).length ==0){
		$("#message").html("APPID不能为空");return false;
	}
	$("#pappid").val($.trim(pappid));
	var psecret = $("#psecret").val();
	if($.trim(psecret).length ==0){
		$("#message").html("SECRET不能为空");return false;
	}
	$("#psecret").val($.trim(psecret));
	var paccount = $("#paccount").val();
	if($.trim(paccount).length ==0){
		$("#message").html("微信号不能为空");return false;
	}
	$("#paccount").val($.trim(paccount));
	var pname = $("#pname").val();
	if($.trim(pname).length==0){
		$("#message").html("公众号名称不能为空");return false;
	}
	$("#pname").val($.trim(pname));
	var pid = $("#pid").val();
	if($.trim(pid).length == 0){
		$("#message").html("公众号原始ID不能为空");return false;
	}
	$("#pid").val($.trim(pid));
	$("#message").html("");
	$("#saveForm").submit();
}
function do_reset_data(){
	$("#saveForm").reset();
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

function do_check_publicname(obj){
	var pname = obj.value;
	if($.trim(pname).length==0){
		$("#message_pubicname").html("公众号名称不能为空");return false;
	}
	$("#message_pubicname").html("");
	$.ajax({
    	  url:"<c:url value='/publicInfo/syncCheckPublicinfoName'/>",
          type:'POST', 
    	  data:{pname:$.trim(pname)},
    	  success:function(data){
    		  if(data.success){
    			  $("#message_pubicname").html('<font color="green">此公众号名称可以使用</font>');
    		  }else{
    			  $("#message_pubicname").html('【'+pname+'】此公众号名称已经存在');
    			  $("#pname").val("");
    		  }
    	  }
      });
	
}
</script>
	</body>
</html>
