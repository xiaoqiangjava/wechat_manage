package com.wechat.cs.modules.sys.controller.login;

import com.wechat.cs.core.utils.sys.UserUtils;
import com.wechat.cs.core.web.BaseController;
import com.wechat.cs.modules.sys.entity.login.UserInfoBean;
import com.wechat.cs.modules.sys.service.login.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 主页controller
 */
@Controller
public class FrameController extends BaseController {

	Logger logger = LoggerFactory.getLogger(FrameController.class);

	@Resource(name = "userService")
	private IUserService userService;

	@RequestMapping(value = "/frame.html")
	@RequiresPermissions("sys:menu:list")
	public ModelAndView initframe(HttpServletRequest request, HttpSession session) {
		logger.info("初始化首页...");
		ModelAndView modelView = new ModelAndView("frame/frame");
		UserInfoBean userInfo= UserUtils.getLoginUserInfo(userService);

		try {
			List<Map<String, Object>> menuList = userService.findPermissionsByusername(userInfo.getUsername());
			logger.info("用户" + userInfo.getUsername() + "拥有的权限: " + menuList);
			modelView.addObject("menuList", menuList);
			modelView.addObject("userInfo", userInfo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return modelView;
	}
}
