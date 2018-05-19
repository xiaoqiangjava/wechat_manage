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
<title>用户编辑</title>
<meta name="keywords" content="">
<meta name="description" content="">
<script>
function subuser() {
	if ($("#oldpassword").val() == null ||$("#oldpassword").val() == "" ) {
		layer.open({
			content : "请输入登录密码!",
			btn : "确定",
			yes : function () {
				layer.close(layer.index);
			}
		});
        return false;
    }
	if ($("#newpassword").val() == null ||$("#newpassword").val() == "" ) {
		layer.open({
			content : "请输入新密码!",
			btn : "确定",
			yes : function () {
				layer.close(layer.index);
			}
		});
		utils.msg();
        return false;
    }
	if ($("#secondpassword").val() == null ||$("#secondpassword").val() == "" ) {
		layer.open({
			content : "请再次输入新密码!",
			btn : "确定",
			yes : function () {
				layer.close(layer.index);
			}
		});
        return false;
    }
	if ($("#secondpassword").val() !=$("#newpassword").val() ) {
		layer.open({
			content : "新密码输入不一致!",
			btn : "确定",
			yes : function () {
				layer.close(layer.index);
			}
		});
        return false;
    }
	

	$.ajax({
		type : 'POST',
		url : '${contextPath_project}/function/updatePassword.do',
		dataType : "json",
		data : {
			"password" : $("#oldpassword").val(),
			"newpassword":$("#newpassword").val(),
		},
		success : function(ret) {
			if (GLOBAL_INFO.SYS_SUCCESS == ret.retCode) {
				layer.open({
					content : ret.resMsg,
					btn : "确定",
					yes : function () {
						var url = "${contextPath_project}/frame.html";
						window.top.location.href = url;
					}
				});
				
			} else {
				layer.open({
					content :ret.resMsg,
					btn : "确定",
					yes : function () {
						layer.close();
					}
				});
			}
		}

	});
}
function cancel() {
	var url = "${contextPath_project}/frame.html";
	window.top.location.href=url;
}
</script>
</head>
<body class="hold-transition skin-blue skin-xwblue sidebar-mini fixed">
	<div class="main-tab">
		<ul class="main-tab__tabs">
			<li class="main-tab__tab main-tab__tab--current"><a>修改登录密码</a></li>
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
												<input type="text" name="loginName" id="loginName"
													class="form-control" value="${username}" readonly="readonly">

											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">*请输入登录密码</label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="oldpassword" 
													id="oldpassword">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">*请输入新密码</label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="newpassword"
													id="newpassword" 
>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">*请再次输入新密码</label>
											<div class="col-sm-6">
												<input type="password" class="form-control" name="secondpassword"
													id="secondpassword" 
>
											</div>
										</div>
										


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
