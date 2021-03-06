package com.itheima.web;

import com.itheima.domain.SysLog;
import com.itheima.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @author LiZongXiao
 * @create 2020/6/26 23:08
 */
@Component
@Aspect
public class LogAOP {
    @Autowired
    ISysLogService sysLogService;

    @Autowired
    private HttpServletRequest request;

    private Date visitTime;// 访问时间
    private Class clazz;// 访问的类
    private Method method;// 访问的方法

    //前置通知 主要是获取开始时间，执行的类是哪一个，执行的是哪一个方法
    @Before("execution(* com.itheima.web.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        //当前时间就是开始访问的时间
        visitTime = new Date();
        //具体要访问的类
        clazz = jp.getTarget().getClass();
        //获取访问的方法的名称
        String methodName = jp.getSignature().getName();// 获取访问的方法的名称
        Object[] args = jp.getArgs();// 获取访问的方法的参数

        //获取具体执行的方法的Method对象
        if (args == null || args.length == 0) {//无参数
            // 只能获取无参数方法
            method = clazz.getMethod(methodName);
        } else {
            // 有参数，就将args中所有元素遍历，获取对应的Class,装入到一个Class[]
            Class[] classeArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classeArgs[i] = args[i].getClass();
            }
            // 获取有参数方法
            method = clazz.getMethod(methodName, classeArgs);
        }
    }

    //后置通知
    @After("execution(* com.itheima.web.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        long time = new Date().getTime() - visitTime.getTime(); //获取访问的时长

        String url = "";
        //获取url
        if (clazz != null && method != null && clazz != LogAOP.class) {
            //1.获取类上的@RequestMapping("/orders")
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if (classAnnotation != null) {
                String[] classValue = classAnnotation.value();
                //2.获取方法上的@RequestMapping(xxx)
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {
                    String[] methodValue = methodAnnotation.value();
                    url = classValue[0] + methodValue[0];

                    //获取访问的ip
                    String ip = request.getRemoteAddr();

                    //获取当前操作的用户
                    SecurityContext context = SecurityContextHolder.getContext();//从上下文中获了当前登录的用户
                    User user = (User) context.getAuthentication().getPrincipal();
                    String username = user.getUsername();

                    //将日志相关信息封装到SysLog对象
                    SysLog sysLog = new SysLog();
                    sysLog.setExecutionTime(time); //执行时长
                    sysLog.setIp(ip);
                    sysLog.setMethod("[类名] " + clazz.getName() + "[方法名] " + method.getName());
                    sysLog.setUrl(url);
                    sysLog.setUsername(username);
                    sysLog.setVisitTime(visitTime);

                    //调用Service完成操作
                    sysLogService.addSysLog(sysLog);
                }
            }
        }
    }
}
