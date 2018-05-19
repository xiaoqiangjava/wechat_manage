package com.wechat.cs.core.web;

import org.springframework.context.ApplicationContext;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by xq on 2018/1/24.
 * web应用初始化信息
 */
public class WebApp {
    /**
     * Spring上下文
     */
    public static ApplicationContext SPRING_CONTEXT;

    /**
     * 静态资源路径
     */
    public static String STATIC_URL;

    /**
     * Cookie域
     */
    public static String COOKIE_DOMAIN;

    /**
     * 创建单例WebApp示例
     */
    private static WebApp SINGLETON = new WebApp();

    /**
     * 动态时间簇
     */
    public static Long TIME_MILLS;

    /**
     * 存储属性的map
     */
    private static Map<String, String> pros = new HashMap<String, String>();

    public static Map<String, String> getPros() {
        return pros;
    }

    public static void setPros(Map<String, String> pros) {
        WebApp.pros = pros;
    }

    /**
     * 私有构造器
     */
    private WebApp() {
    }

    /**
     * 外部通过该方法获取WebApp示例(单例模式)
     * @return
     */
    public static WebApp getWebApp() {
        if (SINGLETON == null) {
            SINGLETON = new WebApp();
        }
        return SINGLETON;
    }

    public static String getValue(String key) {
        return pros.get(key);
    }
}
