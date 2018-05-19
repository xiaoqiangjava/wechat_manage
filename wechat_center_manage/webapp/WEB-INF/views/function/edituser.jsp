<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.wechat.cs.core.web.WebApp"%>
<!DOCTYPE html>
<!--[if IE 8]><html class="lt-ie9 ie8" lang="zh-cmn-Hans"><![endif]-->
<!--[if gte IE 9]><!-->
<%@include file="/WEB-INF/views/inc/default.jsp"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="zh-cmn-Hans">
<!--<![endif]-->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<meta name="google" value="notranslate">
<meta http-equiv="Cache-Control" content="no-siteapp">
<meta name="robots" content="index,follow">
	<link rel="section icon" href="###">
<meta name="viewport"
	content="width=device-width,initial-scale=1,shrink-to-fit=no">
<!--[if lt IE 9]>
  <script src="${contextPath_static}/vendors/html5shiv/html5shiv-3.7.3.min.js?v=<%=WebApp.TIME_MILLS %>"></script><![endif]-->
<link rel="stylesheet"
	href="${contextPath_static}/js/admin-lte/bootstrap/css/bootstrap.min.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/js/admin-lte/dist/css/AdminLTE.min.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/js/admin-lte/dist/css/skins/skin-blue.min.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/js/admin-lte/plugins/font-awesome/4.7.0/css/font-awesome.min.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/css/common/main.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/css/common/product.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/css/common/common.css?v=<%=WebApp.TIME_MILLS %>">
<title>用户编辑</title>
<meta name="keywords" content="">
<meta name="description" content="">
<script>
	function checkMobile(phoneNum) {
		var re = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		var flag = re.test(phoneNum);
		return flag;
	}
	function checkEmail(email) {
		var reg = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9._-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		var flag = reg.test(email);
		return flag;
	}
	function subuser() {
		var loginName = $("#loginName").val();
		var username = $("#username").val();
		var mail = $("#mail").val();
		var phone = $("#phone").val();
		var groupid = $("#groupid").val();
		var useratate = $("input[name='useratate']:checked").val();
		if (username == null || username == "") {
			utils.msg("请输入用户姓名");
			return false;
		}
		if (mail != null && mail!= "" && !checkEmail(mail)) {
			utils.msg("邮箱未输入或格式错误");
			return false;
		}
		if (phone == null || phone == "" || !checkMobile(phone)) {
			utils.msg("联系手机未输入或格式错误");
			return false;
		}
		if (groupid == null || groupid == "" || groupid == "请选择") {
			utils.msg("请选择角色");
			return false;
		}

		$.ajax({
			type : 'POST',
			url : '${contextPath_project}/function/updateUser',
			dataType : "json",
			data : {
				"loginName" : loginName,
				"username" : username,
				"mail" : mail,
				"phone" : phone,
				"groupid" : groupid,
				"useratate" : useratate
			},
			success : function(ret) {
				if (GLOBAL_INFO.SYS_SUCCESS == ret.retCode) {
					utils.msg({
						text: ret.resMsg,
						btns: [{
							text: "确定",
							classes: "btn--primary",
							action: function(){
								var url = "${contextPath_project}/function/toadminlist";
								window.location.href = url;
								this.remove();
							}
						}]
					});
					
				} else {
					utils.msg(ret.resMsg);
				}
			}

		});
	}
	function cancel() {
		var url = "${contextPath_project}/function/toadminlist";
		window.location.href = url;
	}
</script>
</head>
<body class="hold-transition skin-blue skin-xwblue sidebar-mini fixed">
	<div class="main-tab">
		<ul class="main-tab__tabs">
			<li class="main-tab__tab main-tab__tab--current"><a>用户编辑</a></li>
		</ul>
		<div class="main-tab__contents">
			<div class="main-tab__content main-tab__content--current">
				<section class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<div class="form-horizontal">
									<form id="edituserform">
										<div class="form-group">
											<label class="col-sm-2 control-label">*用户登录名</label>
											<div class="col-sm-6">
												<input type="text" name="loginName" id="username"
													class="form-control" value="${userInfo.username}"
													readonly>

											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">*姓名</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="username"
													id="realname" value="${userInfo.realname}">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">*联系手机</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" name="phone"
													value="${userInfo.phone}" id="phone"
													onkeyup='this.value=this.value.replace(/\D/gi,"")'>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">*角色</label> <select
												class="col-sm-6" name="groupid" id="groupid">
												<option selected="selected">请选择</option>
												<c:choose>
													<c:when test="${null != groupList}">
														<c:forEach var="data" items="${groupList}">
															<option value="${data.F_GROUP_ID}"
																<c:choose>
															<c:when test="${data.F_GROUP_ID==userinfo.F_GROUP_ID}">
															selected="selected"
															</c:when>
															</c:choose>>${data.F_GROUP_NAME}</option>
														</c:forEach>
													</c:when>
												</c:choose>
											</select>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">账号状态</label>
											<div class="col-sm-6">
												<input type="radio" name="userstatus" value="1" />启用&nbsp;<input
													type="radio" name="userstatus" value="0" />禁用
											</div>
										</div>
										<script>
					$("input[name='userstatus'][value='" + ${userInfo.status} + "']").attr("checked", true);
					
</script>

									</form>
									<div class="text-center coupon-form-action">
										<button onclick="subuser()" class="btn btn-primary">提交</button>
										<button onclick="edituserform.reset();"
											class="btn btn-primary">清除</button>
										<button onclick="cancel();" class="btn btn-primary">取消</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

</body>
</html>
