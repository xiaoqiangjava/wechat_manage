package com.wechat.cs.core.utils.sys;

import com.wechat.cs.core.utils.StringUtils;
import com.wechat.cs.modules.sys.entity.login.UserInfoBean;
import com.wechat.cs.modules.sys.service.login.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by xq on 2018/1/25.
 * 用户信息相关的工具类
 */
public class UserUtils {

    public final static Logger logger = LoggerFactory.getLogger(UserUtils.class);

    /**
     * 获取用户权限列表
     * @return
     */
    public static Set<String > getPermissionsList(String username, IUserService userService) {
        List<Map<String, Object>> permissionList = userService.findPermissionsByusername(username);
        Set<String> set = new HashSet<String>();
        if (StringUtils.isNotEmpty(permissionList)) {
            for (Map<String, Object> permission : permissionList) {
                set.add(String.valueOf(permission.get("permission")));
                List<Map<String, Object>> subMenus = (List<Map<String,Object>>) permission.get("subMenus");
                if (StringUtils.isNotEmpty(subMenus)) {
                    for (Map<String, Object> subMenu : subMenus) {
                        set.add(String.valueOf(subMenu.get("permission")));
                    }
                }
            }
        }
        logger.info("用户" + username + "拥有的权限为: " + set.toString());
        return set;
    }

    /**
     * 获取用户信息
     * @param userService
     * @return
     */
    public static UserInfoBean getLoginUserInfo(IUserService userService) {
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        logger.info("登录成功后获取用户信息: " + username);
        UserInfoBean userInfoBean = userService.findByUsername(username);
        return userInfoBean;
    }

    /**
     * 获取登录用户名称
     * @return
     */
    public static String getLoginUsername() {
        return (String) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 获取加密后的密码
     * @param username 用户名
     * @param credentials 密码
     * @return
     */
    public static String Md5Password(String username, String credentials) {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(credentials)) {
            return null;
        }
        //加密算法, 适用MD5
        String hashAlgorithmName = "MD5";
        //循环加密次数
        int hasIterators = 2;
        //加密适用的盐
        String salt = "xwtech" + username;
        String md5Password = new SimpleHash(hashAlgorithmName, credentials, ByteSource.Util.bytes(salt), hasIterators).toString();
        return md5Password;
    }
}
