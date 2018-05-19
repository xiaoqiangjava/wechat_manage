<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.wechat.cs.core.web.WebApp"%>
<!DOCTYPE html>
<!--[if IE 8]><html class="lt-ie9 ie8" lang="zh-cmn-Hans"><![endif]-->
<!--[if gte IE 9]><!-->
<%@include file="/WEB-INF/views/inc/default.jsp"%>
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
  <script src="${contextPath_static}/vendors/html5shiv/html5shiv-3.7.3.min.js"></script><![endif]-->
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
	href="${contextPath_static}/css/common/common.css?v=<%=WebApp.TIME_MILLS %>">
<link rel="stylesheet"
	href="${contextPath_static}/css/common/product.css?v=<%=WebApp.TIME_MILLS %>">
<title>系统管理-权限管理</title>
<meta name="keywords" content="">
<meta name="description" content="">
<script>
$(document).ready(function () {
    $("#btn_center").click(function () {
        popCenterWindow();
    });

    $("#btn_right").click(function () {
        popRightWindow();
    });
    $("#btn_left").click(function () {
        popLeftWindow();
    });

}); 


	function checkAll(e) {
		var checked = e.checked;
		if (checked) {
			$("[name='itemcheck']").prop('checked', true);
			;//全选   

		} else {
			$("[name='itemcheck']").prop('checked', false);
			;//取消全选   
		}
	}
	function onSearch() {
		var loginName = $("#loginName").val();
		var url = "${contextPath_project}/function/toAdminList.html?username=" + loginName;
		window.location.href = url;
	}
	
	function deleteAdmin(username){
		
		utils.msg({
			text: "您确定要删除选择的用户吗?",
			btns: [{
				text: "确定",
				classes: "btn--primary",
				action: function(){
					var url="${contextPath_project}/function/delUser.html?username="+username;
					window.location.href = url;	
					this.remove();
				}
			}, utils.msg.BTN.cancel]
		});
	}
	
	function deleteSerial(){
		var checkedList = new Array();
		$("input[name='itemcheck']:checked").each(function() {
		checkedList.push($(this).val());
				});
		if(checkedList.toString()==""||checkedList.toString()==null){
			utils.msg("未选择用户");
			return;
		}
		utils.msg({
			text: "您确定要删除选择的用户吗?",
			btns: [{
				text: "确定",
				classes: "btn--primary",
				action: function(){
					var url="${contextPath_project}/function/deleteSerial.html?deleteuser=" + JSON.stringify(checkedList);
					window.location.href = url;	
					this.remove();
				}
			}, utils.msg.BTN.cancel]
		});
			
			
		}
</script>
</head>
<body
	class="hold-transition skin-blue sidebar-mini skin-xwblue fixed in-frame">
	<div class="main-tab">
		<ul class="main-tab__tabs">
			<li class="main-tab__tab main-tab__tab--current  "><a
				href="${contextPath_project}/function/toAdminList">管理员列表</a></li>
			<li class="main-tab__tab "><a
				href="${contextPath_project}/function/toGroupsList">角色列表</a></li>
			<li class="main-tab__tab "><a
				href="${contextPath_project}/function/toNewUser">新增管理员</a></li>
			<li class="main-tab__tab "><a
				href="${contextPath_project}/function/toFunctionAdmin">新增角色权限</a></li>
		</ul>
		<div class="main-tab__contents">
			<div>
				<!-- Main content -->
				<section class="content">
					<div class="row">
						<div class="col-md-12">
							<div class="box box-primary">
								<div class="box-header with-border">

									<div>
										<div class="form-inline">

											<button onclick="deleteSerial();" class="btn btn-primary">删除</button>
											<div class="form-control-static">用户名：</div>
											<input type="text" id="loginName" class="form-control">
											<button onclick="onSearch();" class="btn btn-primary">搜索</button>


										</div>
									</div>
								</div>

								<div class="box-body">
									<table class="table table-bordered m-t-sm">
										<tbody>
											<tr>

												<th style="width: 20px"><input type="checkbox"
													name="maincheck" onchange="checkAll(this)" /></th>
												<th style="width: 120px">用户名</th>
												<th style="width: 70px">真实姓名</th>
												<th style="width: 50px">手机号码</th>
												<th style="width: 100px">创建时间</th>
												<th style="width: 20px">创建者</th>
												<th style="width: 100px">状态</th>
												<th style="width: 50px">备注</th>
												<th style="width: 100px">角色类型</th>
												<th style="width: 160px">操作</th>
											</tr>
											<c:choose>
												<c:when test="${null != adminList}">
													<c:forEach var="data" items="${adminList}">
														<tr>
															<td><input type="checkbox" name="itemcheck"
																value="${data.username}" /></th></td>

															<td>${data.username}</td>
															<td>${data.realname}</td>
															<td>${data.phone}</td>
															<td>${data.create_date}</td>
															<td>${data.create_by}</td>
															<td>${data.status}</td>
															<td>${data.remarks}</td>
															<td>${data.name}</td>
															<td><a
																  href="${contextPath_project}/function/toedituserform.html?username=${data.username}">编辑</a> &nbsp;|&nbsp; <a
																href="##" onclick='deleteAdmin("${data.username}")'
																class="">删除</a></td>

														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>


								</div>
								<!-- 分页 -->
								<div class="box-footer clearfix paginateWrapper"
									id="qureypaginateWrapper"></div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<div class="main-tab__content"></div>
		</div>
	</div>
	<!-- /.content -->

	<script
		src="${contextPath_static}/js/admin-lte/plugins/datapage/jquery.page.js?v=<%=WebApp.TIME_MILLS %>"></script>

	<script
		src="${contextPath_static}/js/admin-lte/plugins/slimScroll/jquery.slimscroll.min.js?v=<%=WebApp.TIME_MILLS %>"></script>
<script type="text/javascript">
  	$(document).ready(function(){
    	$("#qureypaginateWrapper").page({
	        index: '${pageInfo.pageNum}',
	        maxIndex: '${pageInfo.pages}',
	        size: '${pageInfo.pageSize}',
	        parameter: 'pn',
	        style: "pagination-sm no-margin pull-right"
	    });
    
  	});
</script>

</body>
</html>