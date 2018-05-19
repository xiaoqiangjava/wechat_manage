package com.wechat.cs.modules.sys.shiro;

import com.wechat.cs.core.utils.sys.UserUtils;
import com.wechat.cs.modules.sys.entity.login.UserInfoBean;
import com.wechat.cs.modules.sys.service.login.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by xq on 2018/1/25.
 * shiro框架Realm, 提供认证和授权相应的用户信息
 */
public class UserRealm extends AuthorizingRealm {
	public final static Logger logger = LoggerFactory.getLogger(UserRealm.class);

	@Autowired
	private IUserService userService;

	/**
	 * 授权的回调方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		//设置用户的权限, 权限信息保存在数据库里, 使用字符串匹配规则, 如: "sys:sys:view"
		String username = String.valueOf(principals.getPrimaryPrincipal());
		logger.info("授权用户: " + username);
		authorizationInfo.setStringPermissions(UserUtils.getPermissionsList(username, userService));
		return authorizationInfo;
	}

	/**
	 * 认证的回调方法
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken authcToken = (UsernamePasswordToken) token;
		String username = authcToken.getUsername();
		logger.info("登录账号: " + username);
		UserInfoBean userInfo = userService.findByUsername(username);
		if (userInfo == null) {
			logger.error("账号不存在!");
			throw new UnknownAccountException("账号不存在!");// 没找到帐号
		}

		if (UserInfoBean.STATUS_LOCKED.equals(userInfo.getStatus())) {
			logger.info("账号已锁定!");
			throw new LockedAccountException("账号已锁定!"); // 帐号锁定
		}
		// 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
		String principal = username;
		String credentials = userInfo.getPassword();
		//realmName: 当前realm对象的名称, 调用父类的getName()方法得到
		String realmName = getName();

		//将用户名和密码交给shiro进行密码匹配
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(principal, credentials, ByteSource.Util.bytes("xwtech" + username), realmName);
		return authenticationInfo;
	}

}
