<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.wechat.cs.core.web.WebApp"%>
<!DOCTYPE html>
<!--[if IE 8]><html class="lt-ie9 ie8" lang="zh-cmn-Hans"><![endif]-->
<!--[if gte IE 9]><!-->

<html lang="zh-cmn-Hans">
<!--<![endif]-->
<head>
	<meta charset="UTF-8">
	<%@include file="/WEB-INF/views/inc/default.jsp"%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit">
	<meta name="google" value="notranslate">
	<meta http-equiv="Cache-Control" content="no-siteapp">
	<meta name="robots" content="index,follow">
	<link rel="section icon" href="###">
	<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
	<!--[if lt IE 9]>
	<script src="${contextPath_static}/vendors/html5shiv/html5shiv-3.7.3.min.js?v=<%=WebApp.TIME_MILLS %>"></script><![endif]-->
	<link rel="stylesheet"
		  href="${contextPath_static}/js/admin-lte/bootstrap/css/bootstrap.min.css?v=<%=WebApp.TIME_MILLS %>">
	<link rel="stylesheet"
		  href="${contextPath_static}/js/admin-lte/dist/css/AdminLTE.min.css?v=<%=WebApp.TIME_MILLS %>">
	<link rel="stylesheet"
		  href="${contextPath_static}/js/admin-lte/dist/css/skins/skin-blue.min.css?v=<%=WebApp.TIME_MILLS %>">
	<link rel="stylesheet"
		  href="${contextPath_static}/css/frame/main.css?v=<%=WebApp.TIME_MILLS %>">
	<link rel="stylesheet"
		  href="${contextPath_static}/js/admin-lte/plugins/font-awesome/4.7.0/css/font-awesome.min.css?v=<%=WebApp.TIME_MILLS %>">
	<title>甘肃移动微信管理后台</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
</head>
<body class="hold-transition skin-blue sidebar-mini skin-xwblue fixed">
	<div class="wrapper">
		<header class="main-header">
			<div class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><i class="fa fa-th"></i></span>
				<!-- logo for regular state and mobile devices -->
				<span class="logo-lg">微信管理后台</span>
			</div>
			<nav class="navbar navbar-static-top">

				<!-- //头部左侧导航 -->
				<!-- 头部右侧导航 -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu"><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false"> <span class="hidden-xs">${userInfo.username }</span> <i class="fa fa-angle-down"></i>
						</a></li>
						<li class="dropdown user user-menu"><a href="${contextPath_project}/function/toUpdatePassword.html" target='js-frame'
							class="dropdown-toggle" > <span class="hidden-xs">修改密码</span> <i class="fa fa-angle-down"></i>
						</a></li>
						<li class="dropdown user user-menu"><a href="${contextPath_project}/logout" 
							class="dropdown-toggle" > <span class="hidden-xs">退出登录</span> <i class="fa fa-angle-down"></i>
						</a></li>
						
					</ul>
				</div>
				<!-- //头部右侧导航 -->
			</nav>
		</header>
		<!-- 左侧列 -->
		<aside class="main-sidebar">
			<section class="sidebar">
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <i class="fa fa-bars"></i> <span class="sr-only">切换边栏</span>
				</a>
				<!-- 左侧导航 -->
				<ul class="sidebar-menu">
				<li><a href="" id="welcome" ><i class="menu__icon menu__icon-home"></i>
			<span class="menu__name">首页</span></a></li>
					<c:choose>
						<c:when test="${null != menuList}">
							<c:forEach var="leftMenu" items="${menuList}">
								<li class="treeview active"><a href="#"> <i
										class="fa fa-lightbulb-o"></i> <span>${leftMenu.menuName}</span>
										<span class="pull-right-container"> <i
											class="fa fa-angle-left pull-right"></i>
									</span>
								</a> <c:choose>
										<c:when test="${null != leftMenu.subMenus}">
											<ul class="treeview-menu">
												<c:forEach var="func" items="${leftMenu.subMenus}">
													<li><a href="${func.url}" target='js-frame'> <i
															class="fa fa-circle-o"></i>${func.menuName}
													</a></li>
												</c:forEach>
											</ul>
										</c:when>
									</c:choose></li>
							</c:forEach>
						</c:when>
					</c:choose>
				</ul>
				<!-- //左侧导航 -->
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- //左侧列 -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<iframe class="main-frame" src="${contextPath_project}/function/toUpdatePassword.html" name="js-frame" id="js-frame">

			</iframe>
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- ./wrapper -->
	<script>
		(function() {
			var match = window.location.search.match(/url=([^&=]+)/);
			if (match && match[1]) {
				$('#js-frame').attr('src', decodeURIComponent(match[1]));
			}
		})();
	</script>
	<script>
		(function() {
			var match = window.location.search.match(/url=([^&=]+)/);
			if (match && match[1]) {
				$('#js-frame').attr('src', decodeURIComponent(match[1]));
			}
		})();
	</script>
</body>
</html>
