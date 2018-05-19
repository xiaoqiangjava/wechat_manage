package com.wechat.cs.modules.sys.service.login;

import com.github.pagehelper.PageInfo;
import com.wechat.cs.modules.sys.entity.login.UserInfoBean;

import java.util.List;
import java.util.Map;

/**
 * Created by xq on 2018/1/25.
 * 用户相关的业务层统一入口
 */
public interface IUserService {
    /**
     * 根据用户名查询用户信息
     * @return
     */
    UserInfoBean findByUsername(String username);

    /**
     * 根据用户名查询用户权限信息
     * @return
     */
    List<Map<String,Object>> findPermissionsByusername(String username);

    /**
     * 修改用户密码
     * @param username
     * @param password
     * @return
     */
    int updateUserInfoByUsername(String username, String password);

    /**
     * 分页查询所有的用户信息
     * @param pageInfo 分页信息
     * @return
     */
    List<Map<String, Object>> findAllUser(PageInfo pageInfo, Map<String, String> param);

    /**
     * 根据用户名称删除用户信息
     * @param username 需要删除的用户名
     * @return
     */
    int delUser(String username);

    /**
     * 批量删除用户信息
     * @param userList 需要批量删除的用户列表
     * @return
     */
    int deleteSerial(List<String> userList);

    /**
     * 根据用户名查询用户信息, 不区分状态
     * @param username
     * @return
     */
    UserInfoBean findUser(String username);

}
