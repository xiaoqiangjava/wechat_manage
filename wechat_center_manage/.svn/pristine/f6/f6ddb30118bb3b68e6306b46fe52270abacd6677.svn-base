package com.wechat.cs.modules.sys.controller.login;

import com.wechat.cs.core.cache.IMemcachedManager;
import com.wechat.cs.core.common.constant.IResultCode;
import com.wechat.cs.core.common.constant.RedisConstants;
import com.wechat.cs.core.common.entity.HandlerResult;
import com.wechat.cs.core.utils.sys.UserUtils;
import com.wechat.cs.core.web.BaseController;
import com.wechat.cs.modules.sys.entity.login.UserInfoBean;
import com.wechat.cs.modules.sys.service.login.IUserService;
import com.xwtech.common.exception.NewLIException;
import com.xwtech.newecp.service.logic.client_impl.common.IQueryUserSimpleInfoService;
import com.xwtech.newecp.service.logic.client_impl.common.ISendMessageService;
import com.xwtech.newecp.service.logic.pojo.DEL100024Result;
import com.xwtech.newecp.service.logic.pojo.QRY100003Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

/**
 * Created by xq on 2018/1/25.
 * 登录相关controller
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

	public final static Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private IUserService userService;

	@Autowired
	private IQueryUserSimpleInfoService queryUserSimpleInfoService;

	@Autowired
	private ISendMessageService sendMessageService;

	@Autowired
	private IMemcachedManager busiCache;

	/**
	 * 登录页面跳转
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login.html")
	public String  login() {
		logger.info("登录页面跳转!");
		return "login/login";
	}

	/**
	 * 忘记密码页面跳转
	 * @return
	 */
	@RequestMapping(value = "/toForgetPassword.html", method = RequestMethod.GET)
	public String toForgetPassword() {
		logger.info("忘记密码页面跳转!");
		return "login/forgetpassword";
	}

	@RequestMapping("loginCode.do")
	@ResponseBody
	public HandlerResult loginCode(String loginName) {
		logger.info("获取验证码用户: " + loginName);
		HandlerResult result = HandlerResult.newInstance();
		busiCache.delete(RedisConstants.RANDOM_CODE + loginName);
		//检查用户是否是本系统用户
		UserInfoBean userInfoBean = userService.findByUsername(loginName);
		if ( userInfoBean == null) {
			result.setRetCode(IResultCode.SYS_FAILED);
			result.setResMsg("该用户不存在!");
			return result;
		}
		Random random = new Random();
		String sRand = "";
		for (int i=0; i<4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
		}
		//将验证码存入缓存中
		busiCache.add(RedisConstants.RANDOM_CODE + loginName, sRand, RedisConstants.RANDOM_CODE_TIMES);

		String msg = "甘肃移动微信管理后台验证码为: " + sRand + ", 两分钟内有效!";
		logger.info("短信验证码: " + msg);
		QRY100003Result qry100003Result = null;
		DEL100024Result del100024Result = null;
		try {
			qry100003Result =  queryUserSimpleInfoService.queryUserSimpleInfo(userInfoBean.getPhone());
			if (null != qry100003Result && !"0".equals(qry100003Result.getResultCode())) {
				logger.info("用户信息查询接口错误编码: " + qry100003Result.getErrorCode() + ":" + qry100003Result.getErrorMsg());
				result.setRetCode(IResultCode.SYS_FAILED);
				result.setResMsg("此号码非甘肃移动用户!");
				return result;
			}
			del100024Result = sendMessageService.sendMsg(userInfoBean.getPhone(), msg);
			if (!"0".equals(del100024Result.getResultCode())) {
				logger.info("发送短信接口错误编码: " + del100024Result.getErrorCode() + ":" + del100024Result.getErrorMsg());
				result.setRetCode(IResultCode.SYS_FAILED);
				result.setResMsg("验证码发送失败!");
				return result;
			}

		} catch (NewLIException e) {
			logger.error("ecp接口调用失败: ", e);
			e.printStackTrace();
		}

		result.setRetCode(IResultCode.SYS_SUCCESS);
		result.setResMsg("验证码已发送至您的手机, 两分钟内有效!");
		return result;
	}

	/**
	 * 忘记密码
	 * @return
	 */
	@RequestMapping(value = "/forgetpassword.do", method = RequestMethod.POST)
	@ResponseBody
	public HandlerResult forgetpassword(String loginName, String loginCode, String newpassword) {
		HandlerResult result = HandlerResult.newInstance();
		String sRand = String.valueOf(busiCache.get(RedisConstants.RANDOM_CODE + loginName));
		if (!loginCode.equals(sRand)) {
			result.setRetCode(IResultCode.SYS_FAILED);
			result.setResMsg("验证码错误!");
		}
		if (userService.findByUsername(loginName) == null) {
			result.setRetCode(IResultCode.SYS_FAILED);
			result.setResMsg("该用户不存在!");
		}
		if (userService.updateUserInfoByUsername(loginName, UserUtils.Md5Password(loginName, newpassword)) < 0) {
			result.setRetCode(IResultCode.SYS_FAILED);
			result.setResMsg("密码修改失败!");
			return result;
		}
		result.setRetCode(IResultCode.SYS_SUCCESS);
		result.setResMsg("密码修改成功!");
		return result;
	}
}
