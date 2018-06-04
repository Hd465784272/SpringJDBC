package com.springdemo.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
//登陆拦截器
public class LoginInterceptor implements HandlerInterceptor{

	/**
	 * Handler执行完成之后调用这个方法 
	 * 在afterCompletion中，可以根据ex是否为null判断是否发生了异常，进行日志记录。 
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * Handler执行之后，ModelAndView返回之前调用这个方法
	 * 在postHandle中，有机会修改ModelAndView； 
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * Handler执行之前调用这个方法，在Handler中可以进行编码、安全控制等处理； 
	 * 不设置拦截的方法如下：
	 * adduser:添加用户
	 * userlogin：用户登陆
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		// TODO Auto-generated method stub
		//获取请求的URL  
        String url = req.getRequestURI();  
        System.out.println("LoginInterceptor.preHandle   url:"+url);
        //不设拦截的如下：
        if(url.indexOf("/adduser")>=0 || url.indexOf("/userlogin")>=0 ){
        	return true;
        }
        //获取Session  
        HttpSession session = req.getSession();  
        String username = (String)session.getAttribute("username_session");  
        System.out.println("session #username"+username);
        if(username != null){  
            return true;  
        }  
        //不符合条件的，跳转到登录界面  
        req.getRequestDispatcher("/views/Blog/login.jsp").forward(req, resp);  
		return false;
	}

}
