package com.wechat.cs.modules.sys.controller.function;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.wechat.cs.core.common.constant.IResultCode;
import com.wechat.cs.core.common.entity.HandlerResult;
import com.wechat.cs.core.utils.sys.UserUtils;
import com.wechat.cs.core.web.BaseController;
import com.wechat.cs.modules.sys.entity.login.UserInfoBean;
import com.wechat.cs.modules.sys.service.login.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xq on 2018/2/4.
 * 权限相关controller
 */
@Controller
@RequestMapping("/function")
public class FunctionController extends BaseController {

    private final static Logger logger = LoggerFactory.getLogger(FunctionController.class);

    @Autowired
    private IUserService userService;

    /**
     * 跳转修改密码页面
     * @param request
     * @return
     */
    @RequestMapping(value = "toUpdatePassword.html", method = RequestMethod.GET)
    public String toUpdatePassword(HttpServletRequest request) {
        logger.info("修改密码页面跳转!");
        request.setAttribute("username", UserUtils.getLoginUsername());
        return "function/updatepassword";
    }

    /**
     * 修改密码功能实现
     * @param password 用户登录密码
     * @param newpassword 新密码
     * @return
     */
    @RequestMapping(value = "updatePassword.do", method = RequestMethod.POST)
    @ResponseBody
    public HandlerResult updatePassword(String password, String newpassword) {
        HandlerResult result = HandlerResult.newInstance();
        UserInfoBean userInfo = UserUtils.getLoginUserInfo(userService);
        logger.info("修改密码的用户: " + userInfo.getUsername());
        if (!(UserUtils.Md5Password(userInfo.getUsername(), password)).equals(userInfo.getPassword())) {
            result.setRetCode(IResultCode.SYS_FAILED);
            result.setResMsg("您输入的密码有误!");
            return result;
        }
        if (userService.updateUserInfoByUsername(userInfo.getUsername(), UserUtils.Md5Password(userInfo.getUsername(), newpassword)) < 1) {
            result.setRetCode(IResultCode.SYS_FAILED);
            result.setResMsg("系统开小差了, 请稍后再试!");
            return result;
        }
        result.setRetCode(IResultCode.SYS_SUCCESS);
        result.setResMsg("您的密码修改成功!");
        return result;
    }

    /**
     * 权限管理中管理员列表页面跳转
     * @param request
     * @return
     */
    @RequestMapping(value = "toAdminList.html", method = RequestMethod.GET)
    public ModelAndView toAdminList(HttpServletRequest request) {
        logger.info("管理员列表页面跳转!");
        ModelAndView view = new ModelAndView("function/adminlist");
        int ps = request.getParameter("ps") != null ? Integer.parseInt(request.getParameter("ps")) : 10;
        int pn = request.getParameter("pn") != null ? Integer.parseInt(request.getParameter("pn")) : 1;
        PageInfo pageInfo = new PageInfo();
        pageInfo.setPageNum(pn);
        pageInfo.setPageSize(ps);
        String username = request.getParameter("username");
        Map<String, String> param = new HashMap<String, String>();
        param.put("username", username);
       logger.info("分页参数: pageSize=" + pageInfo.getPageSize() + ", pageNum=" + pageInfo.getPageNum() );
        List<Map<String, Object>> adminList = userService.findAllUser(pageInfo, param);
        view.addObject("adminList", adminList);
        view.addObject("pageInfo", ((Page<Map<String, Object>>) adminList).toPageInfo());
        return view;
    }

    /**
     * 根据用户名删除单个用户
     * @param usrname 需要删除的用户名称
     * @return
     */
    @RequestMapping(value = "delUser", method = RequestMethod.GET)
    public ModelAndView delUser(String username) {
        ModelAndView view = new ModelAndView("function/adminlist");
        logger.info("删除的用户信息: " + username);

        userService.delUser(username);

        PageInfo pageInfo = new PageInfo();
        pageInfo.setPageSize(10);
        pageInfo.setPageNum(1);
        Map<String, String> param = new HashMap<String, String>();
        List<Map<String, Object>> adminList = userService.findAllUser(pageInfo, param);
        view.addObject("adminList", adminList);
        view.addObject("pageInfo", ((Page<Map<String, Object>>) adminList).toPageInfo());
        return view;
    }

    /**
     * 批量删除用户信息
     * @aram deleteuser
     * @return
     */
    @RequestMapping(value = "deleteSerial", method = RequestMethod.GET)
    public ModelAndView deleteSerial(String deleteuser) {
        ModelAndView view = new ModelAndView("function/adminlist");
        logger.info("批量删除的用户信息: " + deleteuser);

        List<String> userList = (List<String>) JSON.parse(deleteuser);

        int n = userService.deleteSerial(userList);
        logger.info("需要删除的用户数: " + userList.size() + ", 实际删除的用户数: " + n);
        PageInfo pageInfo = new PageInfo();
        pageInfo.setPageSize(10);
        pageInfo.setPageNum(1);
        Map<String, String> param = new HashMap<String, String>();
        List<Map<String, Object>> adminList = userService.findAllUser(pageInfo, param);
        view.addObject("adminList", adminList);
        view.addObject("pageInfo", ((Page<Map<String, Object>>) adminList).toPageInfo());
        return view;
    }

    @RequestMapping("toedituserform.html")
    public ModelAndView toedituserform(String username) {
        logger.info("编辑管理员列表: " + username);
        ModelAndView view = new ModelAndView("function/edituser");
        UserInfoBean userInfoBean = userService.findUser(username);
        view.addObject("userInfo", userInfoBean);
        return view;
    }
}
