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
<link rel="stylesheet" type="text/css" href="<c:url value="/images/base1eec8c.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/images/pagination1ec5f7.css"/>" />
</head>

<body>
	<jsp:include page="../../../common/common_head.jsp" />
	
	<div class="gonggao" style="height: auto !important; padding-bottom: 50px;">
		<div class="pbox">
			<!-- 公众号功能菜单 -->
			<jsp:include page="../../../common/common_menu.jsp" />
			<div class="col_main">
				<h2>
					<span><img class="home_tips"
						src="<c:url value="/images/p6.jpg"/>" /></span> 当前位置：自定义菜单管理
				</h2>
				<div class="list_table">
						<table>
							<tr><td height="40px">
		<a height="32" width="106" id="addMaterialText" class="btn btn_primary addMenu" data-gid="">添加菜单</a>
						</td>
						<td colspan="2" style="padding: 0 10px;font-size: 13px;color:#666;">
									<span id="do_init_menu" style="color:red">提示：</span>
							自定义菜单最多包括3个一级菜单，每个一级菜单最多包含5个二级菜单。一级菜单最多4个汉字，二级菜单最多7个汉字，多出来的部分将会以“...”代替。
						<br/>&emsp;&emsp;<strong>请注意，创建自定义菜单后，由于微信客户端缓存，需要24小时微信客户端才会展现出来。
						</strong>
						</td>
						</tr>
						</table>
						<table class="ListMenu" border="0" cellspacing="0" cellpadding="0" width="1000px">
						<thead>
							<tr>
								<th>显示顺序</th>
								<th>主菜单名称</th>
								<th>URL/触发关键词</th>
								<th>是否启用</th>
								<!--<th>是否绑定</th>
								--><th width="180px">操作</th>
							</tr>
						</thead>	
						<tbody>
							<c:forEach items="${pMenuList}" var="pmenu">
							
								<c:if test="${pmenu.menulevel eq 1 }">
									<tr>
										<td style="color:red;font-weight: bold;text-align: center;">${pmenu.menuseq}</td>
										<td style="font-weight: bold">${pmenu.menuname}</td>
										<td>${pmenu.menukey}${pmenu.menuurl}</td>
										<td class="talign">${pmenu.menustatus eq 0 ?"已开启":"未开启"}</td>
										<!--<td></td>
										--><td class="talign"><a href="<c:url value="/publicMenu/updatePublicMenu?menuname=${pmenu.menuname}&pname=${pmenu.pname}&menulevel=${pmenu.menulevel}"/>" >
											<li class="icon18_common edit_gray"  title="修改">修改</li></a> &nbsp;  &nbsp;
										<a href="<c:url value="/publicMenu/removePublicMenu?menuname=${pmenu.menuname}&pname=${pmenu.pname}&menulevel=${pmenu.menulevel}"/>" onclick="return confirm('确认删除菜单吗？');" >
											<i class="icon18_common del_gray" title="删除" >删除</i></a></td>
									</tr>
								
								<c:forEach items="${pMenuList}" var="cmenu">
									<c:if test="${pmenu.menuname eq cmenu.parentmenu}">
									<tr>
										<td class="talign">${cmenu.menuseq}</td>
										<td style="padding-left: 50px">${cmenu.menuname}</td>
										<td>${cmenu.menukey}${cmenu.menuurl}</td>
										<td class="talign">${cmenu.menustatus eq 0 ?"已开启":"未开启"}</td>
										<!--<td class="talign">${cmenu.bindstatus eq 10 ?"未绑定":"已绑定"}</td>
										--><td class="talign"><a href="<c:url value="/publicMenu/updatePublicMenu?menuname=${cmenu.menuname}&pname=${pmenu.pname}&menulevel=${cmenu.menulevel}"/>" >
													<li class="icon18_common edit_gray" title="修改">修改</li></a> &nbsp;&nbsp;  
										<a href="<c:url value="/publicMenu/removePublicMenu?menuname=${cmenu.menuname}&pname=${pmenu.pname}&menulevel=${cmenu.menulevel}"/>" onclick="return confirm('确认删除菜单吗？');">
													<i class="icon18_common del_gray"  title="删除">删除</i></a></td>
									</tr>
									</c:if>
								</c:forEach>
								</c:if>
							</c:forEach>
							<tr>
								<td colspan="7">
									<a height="32" width="106" id="addMaterialText" class="btn btn_primary" onclick="do_create_menu()">生成菜单</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span id="do_init_menu" style="color:red"></span>
								</td>
							</tr>
						</tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
<!-- 弹出DIV 样式 -->
<style>
.dialog-content-{background-color:#BDBDBD; position:absolute; z-index:99; left:0; top:0; width:100%; height:1000px;opacity:0.5;filter: alpha(opacity=50);-moz-opacity: 0.5;}
.dialog-content{position:absolute;width:450px; left:50%; top:50%; margin-left:-200px; height:auto; z-index:100;background-color:#fff; border:1px #698ba0 solid; padding:1px;}
.dialog-content .dhead{padding: 10px;background: #f0faff;border-bottom: 1px solid #adbcc5;height: 20px}
.dialog-content .dtitle{float: left;font-size: 14px;}
.dialog-content .dclose{float: right;}
.dialog-content .dclose a{display: block;width: 19px;height: 19px;overflow: hidden;font-weight: bolder;}
.px{height: 30px;width: 200px;}
</style>

	<!-- Page Foot Start -->
	<jsp:include page="../../../common/common_foot.jsp" />
	<!-- Page Foot End  -->

<!-- 编辑菜单DIV  Start-->
<div class="dialog-content-" name="dialog-content-" id="dialog-edit-"></div>
<div class="dialog-content" id="dialog-edit" style="display: block;">
    <div class="dhead" >
        <h3 class="dtitle">编辑菜单</h3>
        <div class="dclose"><a href="javascript:;" onclick="return closeDIV();" title="关闭">X</a></div>
    </div>
        <div class="dbody">
        <div class="form">
        	<form action="<c:url value="/publicMenu/modifyPublicMenu"/>" method="post" id="realinfo_form">
        	<input type="hidden" name="pname" value="${publicInfoMenu.pname}" />
        	<input type="hidden" name="menunameold" value="${publicInfoMenu.menuname}" />
				<table border="0" cellpadding="0" cellspacing="0" width="100%" style="font-size: 14px;">
					<tbody>
					<tr>
						<td align="right" height="52" width="130">主菜单:</td>
						<td>
							<div class="mr15 l">
							<select name="parentmenu" id="parentmenu">
								<option value="0">主菜单不用选</option>
								<c:forEach items="${pMenuList}" var="pm">
									<c:if test="${pm.menulevel eq 1 }">
										<option  value="${pm.menuname}" ${pm.menuname eq publicInfoMenu.parentmenu?'selected="selected"':'' } >${pm.menuname}</option>
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
							<input id="menuname_edit" class="px" name="menuname" title="主菜单名称" value="${publicInfoMenu.menuname}" type="text" />
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">菜单触发类型:</td>
						<td><div class="mr15 l">
							<select name="menutype" id="menutype_edit">
								<option value="0">选择菜单响应类型</option>
								<option value="click" ${publicInfoMenu.menutype eq "click"?'selected="selected"':'' }>关键词</option>
								<option value="view" ${publicInfoMenu.menutype eq "view"?'selected="selected"':'' }>触发URL</option>
							</select></div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr><td colspan="5" style="padding-left:50px;color:#666 ;font-size: 12px;">1.配置关键词，开发者可以通过自定义回复管理与用户进行交互；<br/>2.配置触发URL点击菜单后则直接跳转至指定URL；</td></tr>
					<tr>
						<td align="right" height="42" width="110">触发关键词/URL:</td>
						<td>
							<div class="mr15 l" id="menutype_edit_value">
							<input id="menukey" class="px" name="${publicInfoMenu.menutype eq 'click'?'menukey':'menuurl'}" title=""
								 value="${publicInfoMenu.menukey}${publicInfoMenu.menuurl}" type="text" /> 
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">启用:</td>
						<td>
							<div class="mr15 l">&nbsp;
							<input type="radio" name="menustatus" ${pMenustatus eq "0"?'checked="checked"':'' }  value="0"  />是&nbsp; &emsp;
							<input type="radio" name="menustatus" ${pMenustatus eq "1"?'checked="checked"':'' }   value="1"  />否&nbsp;
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<!--<tr>
						<td align="right" height="42" width="110">绑定:</td>
						<td>
							<div class="mr15 l">&nbsp;
							<input type="radio" name="bindstatus" ${publicInfoMenu.bindstatus eq "10"?'checked="checked"':'' }  value="0"  />否&nbsp; &emsp;
							<input type="radio" name="bindstatus" ${publicInfoMenu.bindstatus eq "20"?'checked="checked"':'' }   value="1"  />是&nbsp;
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					--><tr>
						<td align="right" height="42" width="110">排序:</td>
						<td>
							<div class="mr15 l">
							<input id="menuseq_edit" class="px" name="menuseq" title="排序"  value="${publicInfoMenu.menuseq}" type="text" /></div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td height="52">&nbsp;</td>
						<td>&nbsp;
							<span class="btnwrap btnpositive"><input class="btn btn_primary" type="submit" name="submit" value="提交" onclick="return doCheckDataEdit();" style=" color:#fff;"/></span> &emsp;
							<span class="btnwrap btnpositive"><input class="btn btn_disabled" type="button" name="submit" value="取消" onclick="return closeDIV();"  style=" color:#333;"/></span>
						</td>
					</tr><tr>
					<td></td>
					<td height="45" id="message_check_data_" style="color:red;padding-left: 10px">&nbsp;</td></tr>
				</tbody></table>
				</form>
        </div>
    </div>
</div>
	<style>
     .mr15 { margin:0 0 0 20px;}
	 .mr15 input { border:solid 1px #DDD; }
    </style>
<!-- 添加菜单DIV  Start-->
<div class="dialog-content-" id="dialog-add-"></div>
<div class="dialog-content" id="dialog-add" style="display: none">
    <div class="dhead" >
        <h3 class="dtitle">添加菜单</h3>
        <div class="dclose"><a href="javascript:;" onclick="return closeDIV();" title="关闭">X</a></div>
    </div>
        <div class="dbody">
        <div class="form">
        	<form action="<c:url value="/publicMenu/addPublicMenu"/>" method="post" id="realinfo_form">
        	<input type="hidden" name="pname" value="${currentPublicInfo.pname}" />
				<table border="0" cellpadding="0" cellspacing="0" width="100%" style="font-size: 14px;">
					<tbody>
					<tr>
						<td align="right" height="52" width="130">主菜单:</td>
						<td>
							<div class="mr15 l">
							<select name="parentmenu" id="parentmenu" class="px">
								<option selected="selected" value="0">主菜单不用选</option>
								<c:forEach items="${pMenuList}" var="pmenu">
									<c:if test="${pmenu.menulevel eq 1 }">
										<option  value="${pmenu.menuname}">${pmenu.menuname}</option>
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
							<input id="menuname" class="px" name="menuname" title="主菜单名称" value="" type="text" />
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">菜单触发类型:</td>
						<td><div class="mr15 l">
							<select name="menutype" id="menutype_add" class="px">
								<option value="0">选择菜单响应类型</option>
								<option value="click">关键词</option>
								<option value="view">触发URL</option>
							</select></div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr><td colspan="5" style="padding-left:50px;color:#666 ;font-size: 12px;">1.配置关键词，开发者可以通过自定义回复管理与用户进行交互；<br/>2.配置触发URL点击菜单后则直接跳转至指定URL；</td></tr>
					<tr>
						<td align="right" height="42" width="110">触发关键词/URL:</td>
						<td>
							<div class="mr15 l" id="menutype_add_value">
							
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">启用:</td>
						<td>
							<div class="mr15 l">&nbsp;
							<input type="radio" name="menustatus"   value="0"  />是&nbsp; &emsp;
							<input type="radio" name="menustatus" checked="checked"  value="1"  />否&nbsp;
							</div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td align="right" height="42" width="110">排序:</td>
						<td>
							<div class="mr15 l">
							<input id="menuseq" class="px" name="menuseq" title="排序"  value="" type="text" /></div>
							<div class="system l"></div>
						</td>
					</tr>
					<tr>
						<td height="52">&nbsp;</td>
						<td>&nbsp;
							<span class="btnwrap btnpositive"><input class="btn btn_primary" type="submit" name="submit" value="提交" onclick="return doCheckData();" style=" color:#fff;"/></span> &emsp;
							<span class="btnwrap btnpositive"><input class="btn btn_disabled" type="button" name="submit" value="取消" onclick="return closeDIV();"  style=" color:#333;"/></span>
						</td>
					</tr><tr>
					<td></td>
					<td height="45" id="message_check_data" style="color:red;padding-left: 10px"></td></tr>
				</tbody></table>
				</form>
        </div>
    </div>
</div>
<!-- 添加菜单DIV  End-->
<script type="text/javascript">
$(function(){
	$(".addMenu").click(function(){
		$("#dialog-add-").css({display:"block",height:$(document).height()});
		  var yscroll =document.body.scrollTop;
		  if(!yscroll){
		  	yscroll =document.documentElement.scrollTop;
		  }
		  $("#dialog-add").css("top",yscroll+100);
		  $("#dialog-add").css("display","block");
	});
	
	$("#menutype_edit").change(function(){
		var menutype =  $("#menutype_edit").val();
		if(menutype == 'click'){
			$("#menutype_edit_value").html('<input id="menukey" class="px" style="width:150px" name="menukey" title="触发关键词" value="" type="text" /> （填写关键词）');
		}else if(menutype == 'view'){
			$("#menutype_edit_value").html('<input id="menuurl" class="px" style="width:150px" name="menuurl" title="触发URL" value="" type="text" /> （填写触发URL）');
		}else{
			$("#menutype_edit_value").html('请选择菜单响应类型');
			
		}
	});

	$("#menutype_add").change(function(){
		var menutype =  $("#menutype_add").val();
		if(menutype == 'click'){
			$("#menutype_add_value").html('<input id="menukey" class="px" style="width:170px" name="menukey" title="触发关键词" value="" type="text" /> （填写关键词）');
		}else if(menutype == 'view'){
			$("#menutype_add_value").html('<input id="menuurl" class="px" style="width:170px" name="menuurl" title="触发URL" value="" type="text" /> （填写触发URL）');
		}else{
			$("#menutype_add_value").html('请选择菜单响应类型');
			
		}
	});
});

function doCheckData(){
	var menuname = $("#menuname").val();
	if(!menuname){
		$("#message_check_data").html("（● 菜单名不能为空）");return false;
	}
	var menutype = $("#menutype").val();
	if(menutype == 0){
		$("#message_check_data").html("（● 请选择菜单触发类型）");return false;
	}
	var menuseq = $("#menuseq").val();
	if(isNaN(menuseq) || menuseq < 1){
		$("#message_check_data").html("（● 排序必须填写大于0的数字）");return false;
	}
}

function doCheckDataEdit(){
	var menuname = $("#menuname_edit").val();
	if(!menuname){
		$("#message_check_data_").html("（● 菜单名不能为空）");return false;
	}
	var menutype = $("#menutype_edit").val();
	if(menutype == 0){
		var parentmenu = $("#parentmenu").val();
		if(parentmenu !=0){
			$("#message_check_data_").html("（● 请选择菜单触发类型）");return false;
		}
	}
	var menuseq = $("#menuseq_edit").val();
	if(isNaN(menuseq) || menuseq < 1){
		$("#message_check_data_").html("（● 排序必须填写大于0的数字）");return false;
	}
}

function closeDIV(){
	$(".dialog-content-").css("display","none");
	$(".dialog-content").css("display","none");
}

function updatePublicMenu(menuname){
	$(".dialog-content-").css({display:"block",height:$(document).height()});
	
}

function do_create_menu(){
	if(!confirm("确定生成菜单吗？")){
		return false;
	}
	
	$.ajax({
		url:"<c:url value='/publicMenu/syncInitPublicMenu'/>",
		data:{pname:"${currentPublicInfo.pname}"},
		type:"post",
		success:function(data){
			if(data.success){
				$("#do_init_menu").html("（菜单发布成功）");
			}else{
				$("#do_init_menu").html("（菜单发布失败，请检查数据格式）");
			}
		},
		error:function(data){
			$("#do_init_menu").html("（网络异常，请稍后再试）");
		}
	});
}
</script>
</body>

</html>
