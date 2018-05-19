<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@	include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>微信管理平台</title>
<%-- <link rel="stylesheet" type="text/css" href="${ctxStaticPre}/css/sys/adminIndex.css"/> --%>
<link rel="stylesheet" type="text/css"
	href="${ctxStaticPre}/css/sys/adminIndex.css" />
<link href="<c:url value="/images/index.css"/>" rel="stylesheet"
	type="text/css" />
<%-- <link href="<c:url value="/styles/index_ht.css"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/images/jquery.min.js"/>"></script> --%>

</head>
<body>

	<div class="bg">
		<div class="wirt_bg"></div>
		<div class="wirt_text">
			<div class="wirt_text1200">
				<a href="<c:url value="/admin"/>" class="curs">首页</a> <a
					href="<c:url value="/publicInfo/addPublicInfo"/>">添加微信公众号</a>
				<!--<a href="#">个人资料</a>
          -->
			</div>
		</div>
		<div class="use">
			<div class="use1200">
				<div class="txz1">
					<span
						style="line-height: 27px; color: rgb(255, 255, 255); font-size: 19px; "></span>

					<!--<img src="http://weixiaoxinpic.qiniudn.com/Public/2014/img/ga.png"/>-->
				</div>
				<div class="line"></div>
				<div class="use_t">
					您好，${loginUser.useraccount}<em>欢迎使用微信公众号</em> <em><a
						href="<c:url value="/index/loginOut"/>" style="color:#fff">退出</a></em>
				</div>
				<div class="use_b">

					<span class="email" style="">手机号： ${loginUser.userphone}<img
						src="<c:url value="/images/use_ico.png"/>" width="16" height="16" /></span>
					<!--<span style="padding-left:20px">上次登录时间:2014-09-17 15:41:41</span>      -->
				</div>
			</div>
		</div>
	</div>

	<!-- 
<div style="text-align:center;background:none repeat scroll 0 0 #af2a27;display:none;"><a href="javascript:void(0)" target="_blank"><img src="<c:url value="/images/001.png"/>"></a></div>
 -->


	<div class="gonggao">
		<div class="g_l2">
			<div class="box2">
				<div class="zh_block3">
					<a href="<c:url value="/publicInfo/addPublicInfo"/>"
						class="a_block">
						<div class="add">
							<p class="add_pic"></p>
							<p class="add_text">添加微信公众号</p>
						</div>
					</a>
				</div>
			</div>
		</div>

		<div class="g_l">
			<div class="box2">
				<h2>
					您的公众号<span style="padding-left:220px"></span>
				</h2>
				<ul class="g_list">
					<c:forEach items="${listP }" var="p" varStatus="pStatus">
						<li style="display: list-item;">${pStatus.count}.<a
							href="<c:url value="/publicInfo/indexPublicInfo?pname=${p.pname}&pid=${p.pid}"/>">${p.pname}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="g_r" style="width:469px;">
			<div class="box2 " id="quotation">
				<h2>
					最新动态<span style="padding-left:350px"><a
						href="javascript:void(0);" target="_blank">更多</a></span>
				</h2>
				<ul class="g_list" style="margin-top: 7.435039296538542px;">
					<li style="display: list-item;"><a href="#?id=48"
						target="_blank">2014-11-14&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
					<!--
      <li style="display: list-item;"><a href="#?id=48" target="_blank">2014-11-14&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=47" target="_blank">2014-11-12&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=46" target="_blank">2014-08-08&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=48" target="_blank">2014-11-14&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=48" target="_blank">2014-11-14&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=47" target="_blank">2014-11-12&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=46" target="_blank">2014-08-08&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=48" target="_blank">2014-11-14&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=48" target="_blank">2014-11-14&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=47" target="_blank">2014-11-12&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
      <li style="display: list-item;"><a href="#?id=46" target="_blank">2014-08-08&nbsp;&nbsp;南京欣网视讯信息技术有限公司</a></li>
    -->
			</div>
		</div>
	</div>

	<div class="zhanghao">
		<c:forEach items="${listP }" var="p" varStatus="pStatus">
			<input type="hidden" name="pname_${pStatus.count}" value="${p.pname}" />
			<!--  Demo List Start -->
			<div class="zh_block tips">
				<div class="close">
					<a href="javascript:void(0)" onclick="delwxaccount($(this))"> <img
						src="images/close.jpg" height="11" width="11" /></a>
				</div>
				<div class="zh_block_left">
					<div class="zh_block_left_top">
						<div class="userBox1"
							style="float: left; width:218px; height:309px; border-bottom:1px solid #e5e5e5;">
							<p>${p.pname}</p>
							<div class="use_h_l">
								<span>点击进入管理</span> <a
									href="<c:url value="/publicInfo/indexPublicInfo?pname=${p.pname}&pid=${p.pid}"/>"
									title="点击进去管理" alt="点击进去管理"> <c:if
										test="${p.pfigureurl == 'null' || empty p.pfigureurl}">
										<img width="140" height="140"
											src="<c:url value="/images/default_head_img.jpg"/>" />
									</c:if> <c:if test="${!empty p.pfigureurl && p.pfigureurl != 'null'}">
										<img width="140" height="140"
											src="<c:url value="${p.pfigureurl}"/>" />
									</c:if>
								</a>
							</div>
						</div>
						<div class="labelBox">
							<div class="labelLine">
								<div class="label"
									onclick="goto_url('<c:url value="/publicMenu?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img1"></div>
									<p class="name">
										<a
											href="<c:url value="/publicMenu?pname=${p.pname}&pid=${p.pid}"/>">自定义菜单管理</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
								<div class="label"
									onclick="goto_url('<c:url value="/materialText?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img4"></div>
									<p class="name">
										<a
											href="<c:url value="/materialText?pname=${p.pname}&pid=${p.pid}"/>">素材管理</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
								<div class="label"
									onclick="goto_url('<c:url value="/replyInfo?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img5"></div>
									<p class="name">
										<a
											href="<c:url value="/replyInfo?pname=${p.pname}&pid=${p.pid}"/>">回复管理</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
								<div class="label"
									onclick="goto_url('<c:url value="/template?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img4"></div>
									<p class="name">
										<a
											href="<c:url value="/template?pname=${p.pname}&pid=${p.pid}"/>">模板消息</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
							</div>
							<div class="labelLine">
								<div class="label"
									onclick="goto_url('<c:url value="/userManagement?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img6"></div>
									<p class="name">
										<a
											href="<c:url value="/userManagement?pname=${p.pname}&pid=${p.pid}"/>">用户管理</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
								<div class="label"
									onclick="goto_url('<c:url value="/groupSend?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img2"></div>
									<p class="name">
										<a
											href="<c:url value="/groupSend?pname=${p.pname}&pid=${p.pid}"/>">群发管理</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
								<div class="label"
									onclick="goto_url('<c:url value="/messManagementF?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img3"></div>
									<p class="name">
										<a
											href="<c:url value="/messManagementF?pname=${p.pname}&pid=${p.pid}"/>">消息管理</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
								<div class="label"
									onclick="goto_url('<c:url value="/activity?pname=${p.pname}&pid=${p.pid}"/>')">
									<div class="img img3"></div>
									<p class="name">
										<a
											href="<c:url value="/activity?pname=${p.pname}&pid=${p.pid}"/>">活动版块</a>
									</p>
									<p class="text">南京欣网视讯信息技术有限公司</p>
								</div>
							</div>
						</div>
					</div>
					<div class="message">
						<strong>备注：将【URL】和【Token】到公众平台中填写。<a
							href="<c:url value="/help.jsp"/>" target="_blank">如何配置？</a></strong><br />
						<strong style="color:red">URL：</strong>http://221.178.251.117/xwwt/API/${p.pkey}<br />
						<strong style="color:red">Token：</strong><em>${p.ptoken}</em>
					</div>
				</div>
				<div class="zh_block_right">
					<div class="countBox">
						<div class="countTop">
							<div class="yestCount">&nbsp;</div>
							<div class="todyCount">&nbsp;</div>
						</div>
						<div class="countTop">
							<div class="yestCount">昨日统计</div>
							<div class="todyCount">今天统计</div>
						</div>
						<div class="countLine">
							<div class="name">文本请求数：</div>
							<div class="countTody Js_t1_${pStatus.count}">${p.textRequestCountDay}</div>
							<div class="countYest Js_t2_${pStatus.count}">${p.textRequestCountYesterday}</div>
						</div>
						<div class="countLine">
							<div class="name">图文请求数：</div>
							<div class="countTody Js_i1_${pStatus.count}">${p.imgtextRequestCountDay}</div>
							<div class="countYest Js_i2_${pStatus.count}">${p.imgtextRequestCountYesterday}</div>
						</div>
						<div class="countLine">
							<div class="name">总请求数：</div>
							<div class="countTody Js_q1_${pStatus.count}">${p.textRequestCountDay + p.imgtextRequestCountDay}
							</div>
							<div class="countYest Js_q2_${pStatus.count}">${p.textRequestCountYesterday + p.imgtextRequestCountYesterday}
							</div>
						</div>
						<div class="countLine">
							<div class="name">新增关注人数：</div>
							<div class="countTody Js_a1_${pStatus.count}">${p.newIncreaseAttentionCountDay}</div>
							<div class="countYest Js_a2_${pStatus.count}">${p.newIncreaseAttentionCountYesterday}</div>
						</div>
						<div class="countLine">
							<div class="name">取消关注人数：</div>
							<div class="countTody Js_c1_${pStatus.count}">${p.cancelAttentionCountDay}</div>
							<div class="countYest Js_c2_${pStatus.count}">${p.cancelAttentionCountYesterday}</div>
						</div>
						<div class="countLine">
							<div class="name">净增长人数：</div>
							<div class="countTody Js_j1_${pStatus.count}">${p.newIncreaseAttentionCountDay - p.cancelAttentionCountDay}</div>
							<div class="countYest Js_j2_${pStatus.count}">${p.newIncreaseAttentionCountYesterday - p.cancelAttentionCountYesterday }</div>
						</div>
						<div class="countLine" style="padding-top: 5px;font-weight: bold;">
							<div class="name">截至当前总绑定量：</div>
							<div class="countTody">${p.allBindNum}</div>
						</div>
					</div>
				</div>
			</div>

			<!--  Demo List End -->
		</c:forEach>

		<div style="clear:both;"></div>

		<div class="zhanghao">
			<div style="clear:both;"></div>
		</div>
	</div>
	<script src="${ctxStaticPre}/js/sys/adminIndex.js"></script> 
	<!-- Page Foot Start -->
	<jsp:include page="../../common/common_foot.jsp" />
	<!-- Page Foot End  -->
</body>
</html>
