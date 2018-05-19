package com.wechat.cs.core.filter;

import com.wechat.cs.core.common.constant.IResultCode;
import com.wechat.cs.core.common.constant.RedisConstants;
import com.wechat.cs.core.common.constant.SystemCodeConstants;
import com.wechat.cs.core.common.entity.HandlerResult;
import com.wechat.cs.core.utils.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.AuthenticatingFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xq on 2018/1/28.
 */
public class FormAuthenticationFilter extends AuthenticatingFilter {

    private final static Logger logger = LoggerFactory.getLogger(FormAuthenticationFilter.class);

    public static final String DEFAULT_ERROR_KEY_ATTRIBUTE_NAME = "shiroLoginFailure";
    public static final String DEFAULT_USERNAME_PARAM = "username";
    public static final String DEFAULT_PASSWORD_PARAM = "password";
    public static final String DEFAULT_REMEMBER_ME_PARAM = "rememberMe";
    private static final Logger log = LoggerFactory.getLogger(FormAuthenticationFilter.class);
    private String usernameParam = "username";
    private String passwordParam = "password";
    private String rememberMeParam = "rememberMe";
    private String failureKeyAttribute = "shiroLoginFailure";

    public FormAuthenticationFilter() {
        logger.info("自定义表单过滤器!");
        this.setLoginUrl("/login/login.html");
    }

    public void setLoginUrl(String loginUrl) {
        String previous = this.getLoginUrl();
        if(previous != null) {
            this.appliedPaths.remove(previous);
        }

        super.setLoginUrl(loginUrl);
        if(log.isTraceEnabled()) {
            log.trace("Adding login url to applied paths.");
        }

        this.appliedPaths.put(this.getLoginUrl(), (Object)null);
    }

    public String getUsernameParam() {
        return this.usernameParam;
    }

    public void setUsernameParam(String usernameParam) {
        this.usernameParam = usernameParam;
    }

    public String getPasswordParam() {
        return this.passwordParam;
    }

    public void setPasswordParam(String passwordParam) {
        this.passwordParam = passwordParam;
    }

    public String getRememberMeParam() {
        return this.rememberMeParam;
    }

    public void setRememberMeParam(String rememberMeParam) {
        this.rememberMeParam = rememberMeParam;
    }

    public String getFailureKeyAttribute() {
        return this.failureKeyAttribute;
    }

    public void setFailureKeyAttribute(String failureKeyAttribute) {
        this.failureKeyAttribute = failureKeyAttribute;
    }

    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        if(this.isLoginRequest(request, response)) {
            if(this.isLoginSubmission(request, response)) {
                if(log.isTraceEnabled()) {
                    log.trace("Login submission detected.  Attempting to execute login.");
                }
                return this.executeLogin(request, response);
            } else {
                if(log.isTraceEnabled()) {
                    log.trace("Login page view.");
                }

                return true;
            }
        } else {
            if(log.isTraceEnabled()) {
                log.trace("Attempting to access a path which requires authentication.  Forwarding to the Authentication url [" + this.getLoginUrl() + "]");
            }

            this.saveRequestAndRedirectToLogin(request, response);
            return false;
        }
    }

    protected boolean isLoginSubmission(ServletRequest request, ServletResponse response) {
        return request instanceof HttpServletRequest && WebUtils.toHttp(request).getMethod().equalsIgnoreCase("POST");
    }

    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        String username = this.getUsername(request);
        String password = this.getPassword(request);
        return this.createToken(username, password, request, response);
    }

    protected boolean isRememberMe(ServletRequest request) {
        return WebUtils.isTrue(request, this.getRememberMeParam());
    }

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        logger.info("shiro登录成功方法调用!");
        //WebUtils.getAndClearSavedRequest(request); //会清理原先保存的地址
        //将用户信息保存到session中
        ((HttpServletRequest) request).getSession().setAttribute(RedisConstants.USER_INFO_SESSION, String.valueOf(subject.getPrincipal()));
        SavedRequest savedRequest = WebUtils.getSavedRequest(request);
        String saveUrl = null;
        if (savedRequest != null) {
            saveUrl =  savedRequest.getRequestUrl();
        }
        logger.info("保存的url: " + saveUrl);
        HandlerResult result = HandlerResult.newInstance();
        result.setRetCode(IResultCode.SYS_SUCCESS);
        result.setSysCode(SystemCodeConstants.OPERATE_SUCCEED);
        result.setRetObj(saveUrl);
        StringUtils.printJson((HttpServletResponse) response, result);
        return false;
    }

    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request, ServletResponse response) {
        logger.info("shiro登录失败方法调用!");
        HandlerResult result = HandlerResult.newInstance();
        result.setRetCode(IResultCode.SYS_FAILED);
        String className = e.getClass().getName();
        if (IncorrectCredentialsException.class.getName().equals(className)) { //密码错误
            result.setSysCode(SystemCodeConstants.PASSWORD_ERROR);
            result.setResMsg("账号或密码错误!");
        } else if (UnknownAccountException.class.getName().equals(className)){ //未知的账号信息
            result.setSysCode(SystemCodeConstants.UNKNOW_ACCOUNT);
            result.setResMsg("未知的账号信息!");
        } else if (LockedAccountException.class.getName().equals(className)) { //账号锁定
            result.setSysCode(SystemCodeConstants.ACCOUNT_LOCKED);
            result.setResMsg("账号锁定!");
        } else { //其他异常信息
            result.setSysCode(SystemCodeConstants.OPERATE_FAILED);
            result.setResMsg("系统异常, 请稍后再试!");
        }
        StringUtils.printJson((HttpServletResponse) response, result);
        return true;
    }

    protected void setFailureAttribute(ServletRequest request, AuthenticationException ae) {
        String className = ae.getClass().getName();
        request.setAttribute(this.getFailureKeyAttribute(), className);
    }

    protected String getUsername(ServletRequest request) {
        return WebUtils.getCleanParam(request, this.getUsernameParam());
    }

    protected String getPassword(ServletRequest request) {
        return WebUtils.getCleanParam(request, this.getPasswordParam());
    }
}
