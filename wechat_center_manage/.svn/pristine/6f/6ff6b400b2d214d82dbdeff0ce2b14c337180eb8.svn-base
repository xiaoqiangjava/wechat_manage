var Util = typeof $ === "function" ? window.$ : {};
/*
	判断浏览器及版本
*/
Util.Browser = function() {
	var a = navigator.userAgent.toLowerCase();
	var b = {};
	b.isStrict = document.compatMode == "CSS1Compat";
	b.isFirefox = a.indexOf("firefox") > -1;
	b.isOpera = a.indexOf("opera") > -1;
	b.isSafari = (/webkit|khtml/).test(a);
	b.isSafari3 = b.isSafari && a.indexOf("webkit/5") != -1;
	b.isIE = !b.isOpera && a.indexOf("msie") > -1;
	b.isIE6 = !b.isOpera && a.indexOf("msie 6") > -1;
	b.isIE7 = !b.isOpera && a.indexOf("msie 7") > -1;
	b.isIE8 = !b.isOpera && a.indexOf("msie 8") > -1;
	b.isGecko = !b.isSafari && a.indexOf("gecko") > -1;
	b.isMozilla = document.all != undefined && document.getElementById != undefined && !window.opera != undefined;
	return b
}();
//弹出框组件
var UOMPDialog =
{
	dialogWinows    : null,
	alertDialog    : null,
	subPageCallback : null,
	dialogCallback  : null,
	subPageWin		: null,
	initDialog : function()
	{
		if(this.dialogWinows == null)
		{
			this.dialogWinows = new dhtmlXWindows();
			this.dialogWinows.attachViewportTo("winVP");
	    	this.dialogWinows.vp.style.border = "#909090 1px solid";
	   	 	this.dialogWinows.setImagePath(GLOBAL_INFO.CONTEXTPATH_STATIC + "/js/lib/dhtmlxSuite/dhtmlxWindows/codebase/imgs/");
		}
	},
	getAlertIframe : function(iframe_index){
		return  window.frames["_subPage_iframe_"+iframe_index] || document.frames["_subPage_iframe_"+iframe_index];
	},
	showDivPage:function(error){
		var zIndex=20;
		var height= $(window).height()-80;
		var width =800;
		var marginLeft=width/2;//弹出窗口left值计算横向窗口居中,
		var top = ($(window).height()/2 - height/2);//竖向居中
		var subPage = "<div id='_error_div_bodyMap' class='bodyMark' style='z-index:"+zIndex+"'></div><div id='_error_div_bodyPop' class='bodyPop' style='margin-left:-"+marginLeft+"px;width:"+width+"px;height:"+height+"px;top:"+top+"px;z-index:"+(zIndex+1)+"' >";
		subPage += "<div class='popMark' id='_popMark_id'  style='height:100%;'></div>";
		subPage += "<a id='href_onclick_closewindow' class='defaultCloseBtn closeWindow' href='javascript:void(0);' onClick='UOMPDialog.closeDivSubPage()' >关闭窗口></a>";
		subPage += "<div class='popContent' style='width:"+(width-20)+"px;height:"+(height-20)+"px;' >";
		subPage += "<div class='top' style='cursor: move;'><h2>Excel上传验证错误信息</h2></div>";
		subPage += "<div id='iframe_sroll_div' style='overflow:auto;height:"+(height - 105)+"px' >";
		subPage +="<div style='padding-left: 30px' align='left'>";
		subPage += error;
		subPage += "</div></div></div></div>";
		$("body").append(subPage);
	},
	closeDivSubPage:function(){
		$("#_error_div_bodyMap").remove();
		$("#_error_div_bodyPop").remove();
	},
	/**
	 * 弹出子页面　dhtml 风格弹出窗口
	 */
	showDHtmlPage : function(title, url, callback,size)
	{
		if(this.dialogWinows == null)
		{
			this.initDialog();
		}
		var subPageWin = this.dialogWinows.window("subPageWin");
		if(subPageWin == null)
		{   
			subPageWin = this.dialogWinows.createWindow("subPageWin", 0, 0, 800, 500);
			subPageWin.setText((title && title != "") ? title : "子页面");
	    	subPageWin.button("park").hide();
		    subPageWin.button("minmax1").hide();
		    subPageWin.button("minmax2").hide();
		    subPageWin.setModal(true);
		}
		subPageWin.attachURL(url);
		if(size)
		{
		  subPageWin.setDimension(size.width,size.hieght);
		}else
		{
		  subPageWin.setDimension(800,500);
		}
		   subPageWin.center();
		this.subPageCallback = function(obj)
		{
			callback && callback(obj);
			setTimeout(function(){subPageWin.close();},0);
		}
	},
	/**
	 * 弹出子页面 修改原有方法兼容原有功能试用
	 */
	showSubPage : function(title, url, callback, size)
	{
		var iframe_index=1;
		//当前窗口的高度与宽度
		var current_client_height = $(window).height();
		var current_client_width = $(window).width();

		var zIndex=11;
		//如果已经存在弹出层,新弹出层
		if($("div.bodyPop")&&$("div.bodyPop").length > 0){
			zIndex = 11 + $("div.bodyPop").length * 4;
			iframe_index = iframe_index + $("div.bodyPop").length;
			// 禁用 mousedown mouseup mousemove
			$("div.bodyPop").unbind("mousedown");
			$(document).unbind("mousemove");
			$(document).unbind("mouseup");
		}
		var width;//弹出窗口宽度,如果不能取到值使用默认设置900px;
		var height;//弹出窗口高度，如果不能取到值使用默认值，当前浏览器高度减80
		var auto_h = "100%";//iframe高度如果，没有输入size,窗口高度100%窗口自适应(iframe宽度固定100%)
		var overflow_y="hidden";//iframe滚动条是否显示如果输入size高度大于当前窗口减80则出现滚动条，否则隐藏
		
		if(size){
			width = size.width;
			if(size.hieght){
				auto_h = size.hieght+"px";//历史代码中使用，hieght 在项目中对大量使用，因此保留此错误
			}
			//if(size.hieght > ( current_client_height - 80 ) ){
				//输入窗口大小大于当前窗口的最大值　
				height =  current_client_height - 80;
			//}else{
				// height = current_client_height - 80;
			//}
				if(size.hieght){
					//输入窗口大小大于滚动条件高度
					if(size.hieght > (height - 105)){
						overflow_y = "scroll";
					}
				}
		}else{
			width = 900;
			height =  current_client_height - 80;
		}
		
		
		var marginLeft=width/2;//弹出窗口left值计算横向窗口居中,
		var top = (current_client_height/2 - height/2);//竖向居中
		var margin_top = 0;
		if(!$('#header').is(':hidden')){
			margin_top = parseInt($("div.header").css("height"))+parseInt($("div.container").css("height"));
		}
		var subPage = "<div  class='bodyMark' style='z-index:"+zIndex+"'></div><div class='bodyPop' style='margin-left:-"+marginLeft+"px;width:"+width+"px;height:"+height+"px;top:"+top+"px;z-index:"+(zIndex+1)+"' >";
		subPage += "<div class='popMark' id='_popMark_id'  style='height:100%;'></div>";
		subPage += "<a id='href_onclick_closewindow' class='defaultCloseBtn closeWindow' href='javascript:void(0);' onClick='UOMPDialog.closeSubPage()' >关闭窗口></a>";
		subPage += "<div class='popContent' style='width:"+(width-20)+"px;height:"+(height-20)+"px;' >";
		subPage += "<div class='top' style='cursor: move;'><h2>"+title+"</h2></div>";
		subPage += "<div id='iframe_sroll_div' style='overflow:"+overflow_y+";height:"+(height - 105)+"px' >";
		subPage += "<iframe id ='_subPage_iframe_"+iframe_index+"' name='_subPage_iframe_"+iframe_index+"' style='height:auto!important;height:"+(auto_h)+";min-height:"+(auto_h)+"' src="+url+" ></iframe>";
		subPage += "</div></div></div>";
		$("body").append(subPage);
		
		///添加拖拽行为,获取最上层弹出窗口
		var _drag_div ;
		if($("div.bodyPop").length > 1){
			_drag_div = $($("div.bodyPop")[$("div.bodyPop").length-1]);
		}else{
			_drag_div = $('div.bodyPop');
		}
		UOMPDialog.moveDiv(_drag_div,current_client_height,current_client_width,marginLeft);
		//END
		this.subPageCallback = function(obj)
		{
			callback && callback(obj);
			
			//UOMPDialog.closeSubPage();
			setTimeout(function(){UOMPDialog.closeSubPage();},0);
		}
	},
	//div 拖拽事件 _drag_div
	//current_client_height
	//current_client_width
	moveDiv:function(_drag_div,current_client_height,current_client_width,marginLeft){
		//按下鼠标左键 事件
		_drag_div.mousedown(function(event) {
			//停止背景DIV的移动事件
			if(event.target.id=='_popMark_id'){
				return;
			};
			//停止关闭窗口图片的移动事件
			if(event.target.id=='href_onclick_closewindow'){
				return;
			};
			//停止IFRAME外层滚动DIV的移动事件
			if(event.target.id=='iframe_sroll_div'){
				return;
			};
			var isMove = true;//是否移动
			//弹出页面初始化left,top 值
			var _init_div_left=_drag_div.offset().left;
			var _init_div_top=_drag_div.offset().top;
			//弹出窗口初始化宽度，高度
			var _init_div_width =_drag_div.width();
			var _init_div_height =_drag_div.height();
			
			//获取鼠标左键按下 鼠标位置 与 窗口初始化位置的相对值
			var abs_x = event.pageX - _init_div_left;
			var abs_y = event.pageY - _init_div_top;
			
			//修改移动方式，创建一个代理虚拟窗口 
			var proxy_bodyPop = $("<div id='_proxy_bodyPop' style='cursor: move;border-style:solid; border-width:1px; opacity:0.5; filter:alpha(opacity=50); position:absolute; top:0; left:0; z-index:10001; background:#f2f1f1; border-color:#aaa;'></div>");
			proxy_bodyPop.css({
				'left' : _init_div_left,
				'top' : _init_div_top,
				'width':_init_div_width,
				'height':_init_div_height
			});
			proxy_bodyPop.appendTo('body');
			//鼠标移动 事件
			$(document).mousemove(function(event) {
				if(!event) event = window.event; //IE
				if (isMove) {
					//移动鼠标后页面 － 按下鼠标与窗口初始化位置的相对值 +　初始化marginLeft
					//当前窗口的值
					var xMoveTo = event.pageX - abs_x ;
					var yMoveTo = event.pageY - abs_y;
					//左边位置限定
					if(  xMoveTo   < 0 ){
						xMoveTo= 0;
					}
					//右边位置限定
					if(xMoveTo + _init_div_width > current_client_width )  {
						 xMoveTo = current_client_width - _init_div_width;
					}  
					//顶部位置限定
					if(yMoveTo < 0 ){
						yMoveTo = 0 ;
					}
					//底部位置限定
					if((yMoveTo + _init_div_height) > current_client_height ) {
						yMoveTo = current_client_height - _init_div_height ;
					}
					//移动时移动代码窗口;
					proxy_bodyPop.css({
						'left' : xMoveTo,
						'top' : yMoveTo
					});
				}
			}).mouseup(function() {
				isMove = false;
				//将弹出窗口移动支代码窗口位置;删除代码窗口
				_drag_div.css({
					'left' : proxy_bodyPop.offset().left + marginLeft,
					'top' : proxy_bodyPop.offset().top
				});
				proxy_bodyPop.remove();
				//添加动画效果
			});
		});	
	},
	/***
	 * IFrame 加载后执行的动作
	 * */
	iframeOnloadExcute:function(obj){
	},
	/**
	 * 关闭所有弹出层
	 * */
	closeAllSubPage : function(){
		var len = $("div.bodyPop").length;
		for(var i=1;i <= len;i++){
//			try{
//				//IE弹出窗口后 关闭窗口再次弹出窗口input标签无法输入问题
//				var iframe = top.UOMPDialog.getAlertIframe(i);
//				iframe.src="";
//			}catch(e){
//			}
//			alert($("div.bodyPop")[i]);
//			
//			$( $("div.bodyMark")[i] ).remove();
//			$( $("div.bodyPop")[i] ).remove();
			this.closeSubPage();
		}
		
		
	},
	
	/**
	 * 新弹出窗口，页面关闭事件
	 * */
	closeSubPage: function(){
			//try{
				//IE弹出窗口后 关闭窗口再次弹出窗口input标签无法输入问题
				//var iframe = top.UOMPDialog.getAlertIframe($("div.bodyMark").length);
			//	iframe.src="";
			//}catch(e){
			//}
			if($("div.bodyPop").length > 1){
				
				$( $("div.bodyMark")[$("div.bodyMark").length-1] ).remove();
				$( $("div.bodyPop")[$("div.bodyPop").length-1] ).remove();
			}else{
				$("div.bodyMark").remove();
				$("div.bodyPop").remove();
			}
			var _drag_div;
			if($("div.top").length > 1){
				_drag_div = $($("div.bodyPop")[$("div.bodyPop").length-1]);
			}else{
				_drag_div = $('div.bodyPop');
			}
			var current_client_height = $(window).height();
			var current_client_width = $(window).width();
			var marginLeft = $(_drag_div).width()/2;
			//最外层添加移动事件
			UOMPDialog.moveDiv(_drag_div,current_client_height,current_client_width,marginLeft);
	},
	/**
	 * 弹出子页面
	 */
	showSubPage2 : function(title, url, callback,size)
	{
		if(this.dialogWinows == null)
		{
			this.initDialog();
		}
		this.subPageWin = this.dialogWinows.window("subPageWin");
		if(this.subPageWin == null)
		{   
		    
			this.subPageWin = this.dialogWinows.createWindow("subPageWin", 0, 0, 800, 500);
			
			this.subPageWin.setText((title && title != "") ? title : "子页面");
			this.subPageWin.button("park").hide();
			this.subPageWin.button("minmax1").hide();
			this.subPageWin.button("minmax2").hide();
			
			this.subPageWin.setModal(true);
		 
		    
		}
		this.subPageWin.attachURL(url);
		if(size)
		{
			this.subPageWin.setDimension(size.width,size.hieght);
		}else
		{
			this.subPageWin.setDimension(800,500);
		}
		this.subPageWin.center();
		this.subPageCallback = function(obj)
		{
			callback && callback(obj);
			this.subPageWin.close();
		}
	},
	
	nextSubPage:function(title, url,size)
	{
		this.subPageWin.attachURL(url);
		if(size)
		{
			this.subPageWin.setDimension(size.width,size.hieght);
		}else
		{
			this.subPageWin.setDimension(800,500);
		}
		this.subPageWin.center();
	},
	
	/**
	 * 弹出子页面
	 * 没有右上角的关闭按钮
	 */
	showSubPageNoClose : function(title, url, callback,size)
	{
		if(this.dialogWinows == null)
		{
			this.initDialog();
		}
		this.subPageWin = this.dialogWinows.window("subPageWin");
		if(this.subPageWin == null)
		{   
		    
			this.subPageWin = this.dialogWinows.createWindow("subPageWin", 0, 0, 800, 500);
			
			this.subPageWin.setText((title && title != "") ? title : "子页面");
			this.subPageWin.button("park").hide();
			this.subPageWin.button("minmax1").hide();
			this.subPageWin.button("minmax2").hide();
			this.subPageWin.button("close").hide();
			this.subPageWin.setModal(true);
		 
		    
		}
		this.subPageWin.attachURL(url);
		if(size)
		{
			this.subPageWin.setDimension(size.width,size.hieght);
		}else
		{
			this.subPageWin.setDimension(800,500);
		}
		this.subPageWin.center();
		this.subPageCallback = function(obj)
		{
			callback && callback(obj);
			this.subPageWin.close();
		}
	},
	
	nextSubPage:function(title, url,size)
	{
		this.subPageWin.attachURL(url);
		if(size)
		{
			this.subPageWin.setDimension(size.width,size.hieght);
		}else
		{
			this.subPageWin.setDimension(800,500);
		}
		this.subPageWin.center();
	},
	
	/**
	 * 关闭子页面 dhtml 关闭窗口
	 */
	hideSubPage : function()
	{
		var subPageWin = this.dialogWinows.window("subPageWin");
		if(subPageWin != null)
		{
			subPageWin.close();
		}
	},

	/**
	 * 关闭子页面
	 */
	hideAlert : function()
	{
		var alertWin = this.dialogWinows.window("alertWin");
		if(alertWin != null)
		{
			alertWin.close();
		}
	},

	/**
	 * 确定框回调
	 */
	dialog_Callback : function(type)
	{
		if(type == "yes")
		{
			this.dialogCallback && this.dialogCallback.yes && this.dialogCallback.yes();
		}
		else
		{
			this.dialogCallback && this.dialogCallback.no && this.dialogCallback.no();
		}
		var alertWin = this.dialogWinows.window("alertWin");
		if(alertWin != null)
		{
			alertWin.close();
		}
	},

	/**
	 * 信息弹出框
	 * msg 提示信息
	 * type 0：提示 1：成功 2：失败
	 */
	alertDhtmlx : function(msg, type, title, callback)
	{
		if(this.dialogWinows == null)
		{
			this.initDialog();
		}
		var alertWin = this.dialogWinows.window("alertWin");
		if(alertWin == null)
		{
			this.dialogCallback = callback;
			alertWin = this.dialogWinows.createWindow("alertWin", 0, 0, 300, 200);
			alertWin.setText((title && title != "") ? title : "提示框");
	    	alertWin.button("park").hide();
		    alertWin.button("minmax1").hide();
		    alertWin.button("minmax2").hide();
		    alertWin.setModal(true);
		    alertWin.center();
		    var popImg = "popbox-faceIco_alert.png";
		    if(type == "1")
		    {
		    	popImg = "popbox-faceIco_success.png";
		    }
		    else if(type == "2")
		    {
		    	popImg = "popbox-faceIco_error.png";
		    }
		    var alertHtml = "<div class='popboxInner' >";
    		alertHtml += "<div class='popboxInner-faceIco'><img src='" + GLOBAL_INFO.CONTEXTPATH_STATIC + "/img/frame/" + popImg + "'></div>";
    		alertHtml += "<div class='popboxInner-text'>" + msg + "</div>";
    		alertHtml += "<div class='popboxInner-btnArea'><a  id='ok_href' href=\"javascript:top.UOMPDialog.dialog_Callback('yes');\"  class='btn-style1'>确认</a></div>";
  			alertHtml += "</div>";
		    alertWin.attachHTMLString(alertHtml);
		    //弹出对话框ESC键退出
		    $(alertWin).attr('tabindex', 1).keydown(function(event){
		    	if(event.keyCode == 13){
		    		return false;
		    	}
		    	if(event.keyCode==27){
		    		UOMPDialog.hideAlert();
		    	} 
		    }) ;
		    $("#ok_href").focus();
		}
	},
	/**
	 * 信息弹出框
	 * msg 提示信息
	 * type 0：提示 1：成功 2：失败
	 */
	alert : function(msg, type, title, callback)
	{
 
		if(!title){
			title = "提示信息";
		}
		this.dialogCallback = callback;
		var classType = "";
		
//		var current_client_height =  $(window).height();
//		var current_client_width =  $(window).width();
//		var left=current_client_width/2 - 350/2 + 175;
//		var top=current_client_height/2 - 160/2;
//		var subPage = "<div><div class='bodyMark'></div><div class='bodyPop tipBox' style='left:"+left+"px;top:"+top+"px' >";
//		subPage += "<div class='popMark' style='height:100%;'></div>";
//		subPage += "<div class='popContent "+classType+"' >";
//		subPage += "<a href='javascript:top.UOMPDialog.closeAlert();' class='defaultCloseBtn closeWindow'>关闭窗口></a>";
//		if(type == 0){
//			subPage += "<div class='top'><h5>"+title+"</h5></div>";
//		}
//		subPage += "<div class='tip'>"+msg+"</div>";
//		subPage += "<div class='btnArea'><a href='javascript:top.UOMPDialog.closeAlert();' class='smallBtn defaultBlue' >确定</a></div>";
//		subPage += "</div></div></div>";
//		var alertDiv = $("<div id='alertDiv' />");
//		alertDiv.append(subPage);
		//$(document).find("body").append(subPage);
		//$("body").append(subPage);
		var btnFn = function(){
				easyDialog.close()
		};
		if(type == 0){
			easyDialog.open({
				  container : {
				    header : title,
				    content : msg,
				    yesFn : btnFn,
				    noFn : false
				  },
				  autoClose : 2000
			});
		}else {
			var imgSrc =top.GLOBAL_INFO.CONTEXTPATH_STATIC+"/img/frame/";
			if(type == 1){
				imgSrc =imgSrc + "tipBoxIco-success.png";
			}
			else if(type == 2){
				imgSrc =imgSrc + "tipBoxIco-failure.png";
			}else{
				imgSrc =imgSrc + "tipBoxIco-warning.png";
			}
			easyDialog.open({
				  container : {
				    // header : title,
				    content : "<img src='"+ imgSrc +"' style='float:left'><p style='float:left;width:180px;padding:10px;'>"+msg+"</p><div style='clear:both;'></div>",
				    yesFn : btnFn,
				    noFn : false
				  },
				  autoClose : 5000
			});
		}

	},
	/**
	 * 新弹出窗口，页面关闭事件
	 * */
	closeAlert: function(){
		try{
			if($("div.tipBox").length > 1){
				$( $("div.bodyMark")[$("div.bodyMark").length-1] ).remove();
				$( $("div.tipBox")[$("div.tipBox").length-1] ).remove();
			}else{
				$("div.bodyMark").remove();
				$("div.tipBox").remove();
			}
		 
		}catch(e){
			alert(e);
		}
	},
	/**
	* 二次确定框
	*/
	confirm : function(msg, callback)
	{
		var btnFn = function(){
			callback && callback.yes && callback.yes();
		    return true;
		};
		var noFn = function(){
			callback && callback.no && callback.no();
		    return true;
		};
		easyDialog.open({
		  container : {
		    header : '确定提示',
		    content : msg,
		    yesFn : btnFn,
		    noFn : noFn
		  }
		});
	},
	/**
	* 二次确定框
	*/
	confirmDhtml : function(msg, callback)
	{
		if(this.dialogWinows == null)
		{
			this.initDialog();
		}
		var alertWin = this.dialogWinows.window("alertWin");
		if(alertWin == null)
		{
			this.dialogCallback = callback;
			alertWin = this.dialogWinows.createWindow("alertWin", 0, 0, 300, 200);
			alertWin.setText("确定提示?");
	    	alertWin.button("park").hide();
		    alertWin.button("minmax1").hide();
		    alertWin.button("minmax2").hide();
		    alertWin.setModal(true);
		    alertWin.center();
		    var confirmHtml = "<div class='popboxInner'>";
    		confirmHtml += "<div class='popboxInner-faceIco'><img src='" + GLOBAL_INFO.CONTEXTPATH_STATIC + "/img/frame/popbox-faceIco_message.png'></div>";
    		confirmHtml += "<div class='popboxInner-text'>" + msg + "</div>";
    		confirmHtml += "<div class='popboxInner-btnArea'><a  href=\"javascript:top.UOMPDialog.dialog_Callback('yes');\" class='btn-style1'>确认</a><a id='no_href' href=\"javascript:top.UOMPDialog.dialog_Callback('no');\" class='btn-style2'>取消(Esc)</a></div>";
  			confirmHtml += "</div>";
		    alertWin.attachHTMLString(confirmHtml);
            //弹出对话框ESC键退出
		    $(alertWin).attr('tabindex', 1).keydown(function(event){
		    	if(event.keyCode == 13){
		    		return false;
		    	}
		    	if(event.keyCode==27){
		    		UOMPDialog.hideAlert();
		    	} 
		    }) ;
		    $("#no_href").focus();
		}
	},
	/**
	* 二次确定框
	*/
	showLoadingDialog : function()
	{
		var tips=[''];
				var r =Math.floor(Math.random()*100);
		$("#loadPage_small").empty();
		$("#loadPage_small").append(tips[r]);
		 easyDialog.open({
			  container :  "loadPage"
		});
	},/**
	* 二次确定框
	*/
	closeLoadingDialog : function()
	{
		easyDialog.close();
	},
	/**
	 * 弹出子页面 修改原有方法兼容原有功能试用
	 */
	showSubPageParams : function(title, url, callback, size ,params)
	{
		var iframe_index=1;
		//当前窗口的高度与宽度
		var current_client_height = $(window).height();
		var current_client_width = $(window).width();

		var zIndex=11;
		//如果已经存在弹出层,新弹出层
		if($("div.bodyPop")&&$("div.bodyPop").length > 0){
			zIndex = 11 + $("div.bodyPop").length * 4;
			iframe_index = iframe_index + $("div.bodyPop").length;
			// 禁用 mousedown mouseup mousemove
			$("div.bodyPop").unbind("mousedown");
			$(document).unbind("mousemove");
			$(document).unbind("mouseup");
		}
		var width;//弹出窗口宽度,如果不能取到值使用默认设置960px;
		var height;//弹出窗口高度，如果不能取到值使用默认值，当前浏览器高度减80
		var auto_h = "100%";//iframe高度如果，没有输入size,窗口高度100%窗口自适应(iframe宽度固定100%)
		var overflow_y="hidden";//iframe滚动条是否显示如果输入size高度大于当前窗口减80则出现滚动条，否则隐藏
		
		if(size){
			if(size.width){
				width = size.width;
			} else{
				width = 960;
			}
			if(size.hieght){
				//输入窗口大小大于滚动条件高度
				if(size.hieght > (current_client_height - 105)){
					overflow_y = "scroll";
				}
				auto_h = size.hieght+"px";//历史代码中使用，hieght 在项目中对大量使用，因此保留此错误
				height = size.hieght;
			} else{
				overflow_y ="hidden";
				height =  current_client_height - 80;
			}
		}else{
			width = 960;
			height =  current_client_height - 80;
		}
		
		var marginLeft=width/2;//弹出窗口left值计算横向窗口居中,
		var top = (current_client_height/2 - height/2);//竖向居中
		var margin_top = 0;
		if(!$('#header').is(':hidden')){
			margin_top = parseInt($("div.header").css("height"))+parseInt($("div.container").css("height"));
		}
		var subPage = "<div  class='bodyMark' style='z-index:"+zIndex+"'></div><div class='bodyPop' style='margin-left:-"+marginLeft+"px;width:"+width+"px;height:"+height+"px;top:"+top+"px;z-index:"+(zIndex+1)+"' >";
		subPage += "<div class='popMark' id='_popMark_id'  style='height:100%;'></div>";
		subPage += "<a id='href_onclick_closewindow' class='defaultCloseBtn closeWindow' href='javascript:void(0);' onClick='UOMPDialog.closeSubPage()' >关闭窗口></a>";
		subPage += "<div class='popContent' style='width:"+(width-20)+"px;height:"+(height-20)+"px;' >";
		subPage += "<div class='top' style='cursor: move;'><h2>"+title+"</h2></div>";
		subPage += "<div id='iframe_sroll_div' style='overflow:"+overflow_y+";height:"+(height - 105)+"px' >";
		subPage += "<iframe id ='_subPage_iframe_"+iframe_index+"' name='_subPage_iframe_"+iframe_index+"' style='overflow:"+overflow_y+";height:"+(auto_h)+"' src="+url+" onload='top.UOMPDialog.iframeOnloadExcute(this)' ></iframe>";
		subPage += "</div></div></div>";
		$("body").append(subPage);
		
		///添加拖拽行为,获取最上层弹出窗口
		var _drag_div ;
		if($("div.bodyPop").length > 1){
			_drag_div = $($("div.bodyPop")[$("div.bodyPop").length-1]);
		}else{
			_drag_div = $('div.bodyPop');
		}
		UOMPDialog.moveDiv(_drag_div,current_client_height,current_client_width,marginLeft);
		//END
		this.subPageCallback = function(obj)
		{
			callback && callback(obj);
			//UOMPDialog.closeSubPage();
			setTimeout(function(){UOMPDialog.closeSubPage();},0);
		}		 
		this.paramsObj = json.clone(params); 
	}
};