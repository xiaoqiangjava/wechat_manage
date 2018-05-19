<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>我的沈阳微信公众号|自定义菜单管理</title>
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

.list_table{padding-left:50px;}
TABLE.ListMenu THEAD TH{BORDER-BOTTOM: #d3d3d3 1px solid; PADDING-BOTTOM: 5px; BACKGROUND-COLOR: #F6F5F3; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; COLOR: #666; FONT-SIZE: 14px; BORDER-TOP: #e3e3e3 1px solid;border-left: #e3e3e3 1px solid; FONT-WEIGHT: normal; BORDER-RIGHT: #ddd 1px solid; PADDING-TOP: 5px; color:#000000; font-weight:bold}
TABLE.ListMenu TBODY TD{BORDER-BOTTOM: #eee 1px solid; PADDING-BOTTOM: 10px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; BORDER-RIGHT: #eee 1px solid; border-left: #eee 1px solid; PADDING-TOP: 10px;
	font-size:12px;_empty-cells:show;word-break: break-all;}
table.ListMenu td.talign{text-align: center;}	
</style>
</head>

<body>
	<jsp:include page="../../../common/common_head.jsp" />
	
	<div class="gonggao" style="height: 750px;">
		<div class="pbox">
			<!-- 公众号功能菜单 -->
			<jsp:include page="../../../common/common_menu.jsp" />
			<div class="col_main">
				<h2>
					<span><img class="home_tips"
						src="<c:url value="/images/p6.jpg"/>" /></span> 当前位置：自定义菜单管理 - 菜单编辑
				</h2>
				<div class="list_table">
<div class="dialog-content">
    <div class="dhead" >
        <h3 class="dtitle">编辑菜单</h3>
    </div>
        <div class="dbody">
        <div class="form">
        	<form action="<c:url value="/publicMenu/modifyPublicMenu"/>" method="post" id="realinfo_form">
        	<input type="hidden" name="pname" value="${pMenu.pname}" />
        	<input type="hidden" name="menunameold" value="${pMenu.menuname}" />
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tbody>
					<tr>
						<td align="right" height="42" width="110">主菜单:</td>
						<td>
							<div class="mr15 l">
							<select name="parentmenu" id="parentmenu">
								<option selected="selected" value="0">主菜单不用选</option>
								<c:forEach items="${pMenuList}" var="pm">
									<c:if test="${pm.menulevel eq 1 }">
										<option  value="${pm.menuname}" ${pm.menuname eq pMenu.parentmenu?'selected="selected"':'' } >${pm.menuname}</option>
									</c:if>
								</c:forEach>
							</select>	
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">(主)菜单名称:</td>
						<td>
							<div class="mr15 l">
							<input id="menuname" class="px" name="menuname" title="主菜单名称" value="${pMenu.menuname}" type="text" />
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">菜单触发类型:</td>
						<td><div class="mr15 l">
							<select name="menutype" id="menutype">
								<option value="0">选择菜单响应类型</option>
								<option value="click" ${pMenu.menutype eq "click"?'selected="selected"':'' }>关键词</option>
								<option value="view" ${pMenu.menutype eq "view"?'selected="selected"':'' }>触发URL</option>
							</select></div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">触发关键词/URL:</td>
						<td>
							<div class="mr15 l" id="menutype_value">
								<input id="menukey" class="px" name="${pMenu.menutype eq 'click'?'menukey':'menuurl'}" title="" value="${pMenu.menukey}${pMenu.menuurl}" type="text" /> 
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">启用:</td>
						<td>
							<div class="mr15 l">
							<input type="radio" name="menustatus"   value="0" ${pMenu.menustatus eq "0"?'checked="checked"':'' }  />是&nbsp;
							<input type="radio" name="menustatus"  value="1"  ${pMenu.menustatus eq "1"?'checked="checked"':'' }  />否&nbsp;
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">排序:</td>
						<td>
							<div class="mr15 l">
							<input id="sortid" class="px" name="menuseq" title="排序"  value="${pMenu.menuseq}" type="text" /></div>
							<div class="system l"></div>
						</td>
					</tr>
					
					<tr>
						<td height="42">&nbsp;</td>
						<td>
							<span class="btnwrap btnpositive"><input class="inner" type="submit" name="submit" value="提交" style=" color:#333;"/></span> &emsp;
						</td>
					</tr><tr><td height="22">&nbsp;</td></tr>
				</tbody></table>
				</form>
        </div>
    </div>
</div>
				</div>
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
<!-- 弹出DIV 样式 -->
<style>
.dialog-content-{background-color:#BDBDBD; position:absolute; z-index:99; left:0; top:0; display:none; width:100%; height:1000px;opacity:0.5;filter: alpha(opacity=50);-moz-opacity: 0.5;}
.dialog-content{position:absolute;width:420px; left:50%; top:50%; margin-left:-200px; height:auto; z-index:100;background-color:#fff; border:1px #698ba0 solid; padding:1px;}
.dialog-content .dhead{padding: 10px;background: #f0faff;border-bottom: 1px solid #adbcc5;height: 20px}
.dialog-content .dtitle{float: left;font-size: 14px;}
.dialog-content .dclose{float: right;}
.dialog-content .dclose a{display: block;width: 19px;height: 19px;overflow: hidden;font-weight: bolder;}
</style>

	<!-- Page Foot Start -->
	<jsp:include page="../../../common/common_foot.jsp" />
	<!-- Page Foot End  -->


<!-- 添加菜单DIV  Start-->
<div class="dialog-content-" name="dialog-content-" id="dialog-content-"></div>

	<style>
     .mr15 { margin:0 0 0 20px;}
	 .mr15 input { border:solid 1px #DDD; }
    </style>

<!-- 添加菜单DIV  End-->
<script type="text/javascript">
$(function(){
	$(".addMenu").click(function(){
		$(".dialog-content-").css({display:"block",height:$(document).height()});
		  //var yscroll =document.documentElement.scrollTop;
		  $(".dialog-content").css("top","240px");
		  $(".dialog-content").css("display","block");
		  document.documentElement.scrollTop=0;
	});
	
	$("#menutype").change(function(){
		var menutype =  $("#menutype").val();
		if(menutype == 'click'){
			$("#menutype_value").html('<input id="menukey" class="px" name="menukey" title="触发关键词" value="${pMenu.menukey}" type="text" /> （填写触发关键词）');
		}else if(menutype == 'view'){
			$("#menutype_value").html('<input id="menuurl" class="px" name="menuurl" title="触发URL" value="${pMenu.menuurl}" type="text" /> （填写触发URL）');
		}else{
			$("#menutype_value").html('请选择菜单响应类型');
			
		}
	});
});
function closeDIV(){
	$(".dialog-content-").css("display","none");
	$(".dialog-content").css("display","none");
}

function updatePublicMenu(menuname){
	$(".dialog-content-").css({display:"block",height:$(document).height()});
	/* $.ajax({
		url:"<c:url value='/publicMenu/getPublicMenu'/>",
		type:'get',
		data:'menuname='+menuname,
		success:function(data){
			if(data.result == 'success'){

			}	
		},
		error:function(data){
			alert(data);	
		}
	}); */
	
}
</script>
</body>

</html>
