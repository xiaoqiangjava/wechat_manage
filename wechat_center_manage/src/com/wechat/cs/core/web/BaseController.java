package com.wechat.cs.core.web;

import com.wechat.cs.core.common.constant.IResultCode;
import com.wechat.cs.core.common.constant.SystemCodeConstants;
import com.wechat.cs.core.common.entity.HandlerResult;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by xq on 2018/1/25.
 * 公共的异常处理类, 可以根据不同的异常返回不同的信息
 */
public abstract class BaseController {
    private final static Logger logger = LoggerFactory.getLogger(BaseController.class);

    /**
     * 密码错误异常
     * @param exception
     * @return
     */
    @ExceptionHandler(IncorrectCredentialsException.class)
    @ResponseBody
    public HandlerResult incorrectCredentials(IncorrectCredentialsException exception) {
        HandlerResult handlerResult = HandlerResult.newInstance();
        handlerResult.setRetCode(IResultCode.SYS_FAILED);
        handlerResult.setSysCode(SystemCodeConstants.PASSWORD_ERROR);
        handlerResult.setResMsg(exception.getMessage());
        logger.error("密码错误异常: " + exception.getMessage(), exception);
        return  handlerResult;
    }

    /**
     * 未知的账号信息异常
     * @param exception
     * @return
     */
    @ExceptionHandler(UnknownAccountException.class)
    @ResponseBody
    public HandlerResult unknownAccount(UnknownAccountException exception) {
        HandlerResult handlerResult = HandlerResult.newInstance();
        handlerResult.setRetCode(IResultCode.SYS_FAILED);
        handlerResult.setSysCode(SystemCodeConstants.UNKNOW_ACCOUNT);
        handlerResult.setResMsg(exception.getMessage());
        logger.error("未知的账号信息异常: " + exception.getMessage(), exception);
        return  handlerResult;
    }

    /**
     * 账号锁定异常
     * @param exception
     * @return
     */
    @ExceptionHandler(LockedAccountException.class)
    @ResponseBody
    public HandlerResult lockedAccount(LockedAccountException exception) {
        HandlerResult handlerResult = HandlerResult.newInstance();
        handlerResult.setRetCode(IResultCode.SYS_FAILED);
        handlerResult.setSysCode(SystemCodeConstants.ACCOUNT_LOCKED);
        handlerResult.setResMsg(exception.getMessage());
        logger.error("账号锁定异常: " + exception.getMessage(), exception);
        return  handlerResult;
    }

    /**
     * 普通异常处理
     * @param e
     * @return
     */
    @ExceptionHandler(Throwable.class)
    @ResponseBody
    public HandlerResult catchException(Throwable e) {
        HandlerResult handlerResult = HandlerResult.newInstance();
        handlerResult.setRetCode(IResultCode.SYS_FAILED);
        handlerResult.setSysCode(SystemCodeConstants.OPERATE_FAILED);
        handlerResult.setResMsg(e.getMessage());
        logger.error("系统异常: ", e);
        e.printStackTrace();
        return handlerResult;
    }
}
