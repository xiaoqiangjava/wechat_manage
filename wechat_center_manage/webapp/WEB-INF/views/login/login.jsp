<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@page import="com.wechat.cs.core.web.WebApp"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="${contextPath_static}/css/login/login.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet" type="text/css" href="${contextPath_static}/js/admin-lte/plugins/font-awesome/4.7.0/css/font-awesome.min.css?v=<%=WebApp.TIME_MILLS %>">
<title>系统登录</title>

</head>
<body   >
	<div class="login" style="width:400px">
		<div class="platform">
			<div class="logo"></div>
			管理控制平台
		</div>
		<div class="login-account">
			<!-- <a class="register-link" href="###">注册</a> -->
			<div class="login-type">账户登录</div>
			<div class="login-form" id="js-login-form">
				<fieldset class="login-fieldset">
					<legend>账号</legend>
					<label class="login-input-block">
						<span class="login-input-icon"><i class="fa fa-user"></i></span>
						<input type="text" name="username" id="username" placeholder="账号" autofocus>
					</label>
				</fieldset>
				<fieldset class="login-fieldset">
					<legend>密码</legend>
					<label class="login-input-block"> <span class="login-input-icon"><i class="fa fa-key"></i></span>
						<input type="password" id="password" name="password" placeholder="密码" required>
					</label>
				</fieldset>
				<div class="form-footer">
					<button class="submit" style="width:60px">登录</button>
					&nbsp; <label class="u-check u-check--checkbox"> <input
						class="u-check__native-control" type="checkbox" name="rememberMe" > <i
						class="u-check__indicator"></i> 自动登录
					</label> &nbsp;
					<button class="login-verify-btn" type="button"
						onclick="resetPassword();">忘记密码?</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			/**
			 * 监听登陆按钮的单击时间
			 */
			$('.submit').on('click', submitLogin);
		});

		//登录请求
		function submitLogin() {
			var rememberMe = $(".form-footer input[type='checkbox']").is(':checked');
			console.log(rememberMe);
			var username = $('#username').val();
			var password = $('#password').val();
			if (!username) {
				layer.open({
					content : "请输入账号!",
					btn : '确定',
					yes : function() {
						layer.close();
					}
				})
				return;
			}
			var url = "${contextPath_project}/login/login.html";
			var param = {
				username : username,
				password : password,
				rememberMe : rememberMe
			};
			$.ajax({
				url : url,
				type : 'POST',
				data : param,
				dataType : 'json',
				success : function(ret) {
					if (ret.retCode == GLOBAL_INFO.SYS_SUCCESS) {
						//登录成功
						console.log("登录成功!");
						if (ret.retObj == null) {
							window.top.location.href = "${contextPath_project}/frame.html"
						} else {
							window.location.href = ret.retObj;
						}
					} else {
						//登录失败
						if (ret.sysCode == "-100002") {
							layer.open({
								content : ret.resMsg,
								btn : '确定',
								yes : function() {
									window.location.reload();
								}
							});
						} else if (ret.sysCode == "-100003") {
							layer.open({
								content : ret.resMsg,
								btn : '确定',
								yes : function() {
									window.location.reload();
								}
							});
						} else if (ret.sysCode == "-100004") {
							layer.open({
								content : ret.resMsg,
								btn : '确定',
								yes : function() {
									window.location.reload();
								}
							});
						} else {
							layer.open({
								content : ret.resMsg,
								btn : '确定',
								yes : function() {
									window.location.reload();
								}
							});
						}
					}
				}

			});
		}
		
		function resetPassword() {
			var url = "${contextPath_project}/login/toForgetPassword.html";
			window.top.location.href = url;
		}
	</script>
</body>
</html>
