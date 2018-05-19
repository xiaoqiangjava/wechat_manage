package com.wechat.cs.core.listener;

import com.wechat.cs.core.web.WebApp;
import com.xwtech.common.service.logic.client.NEWECPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Properties;

/**
 * Created by xq on 2018/1/24.
 */
public class ApplicationContextListener implements ServletContextListener {
    private final static Logger logger = LoggerFactory.getLogger(ApplicationContextListener.class);
    @Override
    public void contextInitialized(ServletContextEvent context) {
     try {
         logger.info("======init WebApp start!======");
         WebApp.SPRING_CONTEXT = WebApplicationContextUtils.getWebApplicationContext(context.getServletContext());
         WebApp.STATIC_URL = WebApp.getValue("sys.static.url");
         WebApp.TIME_MILLS = System.currentTimeMillis();
         //设置静态资源访问路径
         context.getServletContext().setAttribute("contextPath_static", WebApp.getValue("sys.static.url"));

         //设置项目路径
         context.getServletContext().setAttribute("contextPath_project", WebApp.getValue("sys.context.url"));
         /*调用初始化Ecp方法*/
         initEcp();
         logger.info("======init WebApp successful!======");
        } catch (Exception e) {
            logger.error("加载配置文件信息失败: " + e.getMessage(), e);
         throw new RuntimeException("加载配置文件失败: " + e.getMessage(), e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    }

    /**
     * 初始化Ecp客户端
     */
    private void initEcp() {
        Properties props = new Properties();
        props.put("crm.client.channel.username", WebApp.getValue("boss.clientUser"));
        props.put("crm.client.channel.userpwd", WebApp.getValue("boss.clientPwd"));
        props.put("crm.client.channel", WebApp.getValue("boss.clientChannel"));
        props.put("crm.platform.url", WebApp.getValue("boss.xwecpURL"));
        NEWECPClient.createInstance(props, new String[]{NEWECPClient.CRM_INSTANCE_NAME});
        logger.info("ApplicateionContextListener initEcp successful!");
    }
}
