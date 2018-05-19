<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.xwtech.center.web.WEBApp"%>
<!DOCTYPE html>
<!--[if IE 8]><html class="lt-ie9 ie8" lang="zh-cmn-Hans"><![endif]-->
<!--[if gte IE 9]><!-->
<%@include file="/WEB-INF/inc/default.jsp"%>
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
    <script src="${contextPath_static}/static/admin-lte/plugins/html5shiv/3.7.3/html5shiv.min.js?v=<%=WEBApp.TIME_MILLS %>"></script>
    <script src="${contextPath_static}/static/admin-lte/plugins/respond/1.4.2/respond.min.js?v=<%=WEBApp.TIME_MILLS %>"></script>
    <![endif]-->
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/bootstrap/css/bootstrap.min.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/dist/css/AdminLTE.min.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/dist/css/skins/skin-blue.min.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/plugins/font-awesome/4.7.0/css/font-awesome.min.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/style/main.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/style/product.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/plugins/jvectormap/jquery-jvectormap-1.2.2.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/plugins/select2/select2.min.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/dist/css/skins/skin-blue.min.css?v=<%=WEBApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/dist/css/skins/_all-skins.min.css?v=<%=WEBApp.TIME_MILLS %>">
<meta name="keywords" content="">
<meta name="description" content="">

<script
	src="${contextPath_static}/static/admin-lte/plugins/jquery-form/jquery.form.min.js?v=<%=WEBApp.TIME_MILLS %>"></script>
<script
	src="${contextPath_static}/static/admin-lte/plugins/jquery-validation-1.15.0/jquery.validate.min.js?v=<%=WEBApp.TIME_MILLS %>"></script>
<script
	src="${contextPath_static}/static/admin-lte/plugins/jquery-validation-1.15.0/jquery-validate.bootstrap-tooltip.js?v=<%=WEBApp.TIME_MILLS %>"></script>
<script
	src="${contextPath_static}/static/admin-lte/plugins/layer/layer.js?v=<%=WEBApp.TIME_MILLS %>"></script>
<script
	src="${contextPath_static}/static/admin-lte/plugins/toastr/toastr.min.js?v=<%=WEBApp.TIME_MILLS %>"></script>
<script
	src="${contextPath_static}/static/admin-lte/plugins/datapage/jquery.page.js?v=<%=WEBApp.TIME_MILLS %>"></script>
<script
	src="${contextPath_static}/static/admin-lte/plugins/bootbox/bootbox.min.js?v=<%=WEBApp.TIME_MILLS %>"></script>
<link rel="stylesheet"
	href="${contextPath_static}/static/admin-lte/plugins/toastr/toastr.min.css?v=<%=WEBApp.TIME_MILLS %>">
</head>
<body>

	<section class="content-header">
		<h1>甘肃移动商城后台首页</h1>
		<ol class="breadcrumb">
			
			<li class="active">甘肃移动商城后台首页</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<div class="box-body">
						<table class="text-center coupon-dash">
							<tbody>
								<tr>
									<td style="width: 200px">
										<div class="h3 text-primary">${shopCount}</div>
										<div>店铺数量总和</div>
									</td>
									<td style="width: 200px">
										<div class="h3 text-primary">${addGoodsCount}</div>
										<div>今日新增商品总数</div>
									</td>
									<td style="width: 200px">
										<div class="h3 text-primary">${addShopCount}</div>
										<div>今日新增店铺数</div>
									</td>
									<td style="width: 200px">
										<div class="h3 text-primary">${servenOrderCount}</div>
										<div>7日订单量</div>
									</td>
									<td style="width: 200px">
										<div class="h3 text-primary">${thirtDayOrderCount}</div>
										<div>30日订单量</div>
									</td>
									<td style="width: 200px">
										<div class="h3 text-primary">${orderCount}</div>
										<div>订单总量</div>
									</td>

								</tr>
							</tbody>
						</table>
					</div>
					<!-- ./box-body -->
				</div>
				<div class="box">
					<div class="box-header with-border">常用功能</div>
					<div class="box-body text-center coupon-menus">
						<div class="row">

							



						</div>
					</div>
					<!-- ./box-body -->
				</div>

			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>

</body>
</html>