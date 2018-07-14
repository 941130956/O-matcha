package com.omatcha.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.omatcha.pojo.Users;
import com.omatcha.service.UserService;
import com.omatcha.service.impl.UserServiceImpl;
import com.omatcha.util.AddShoppingCart;

public class LoginServlet extends HttpServlet{
	UserService us = new UserServiceImpl();
	Users user;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 req.setCharacterEncoding("utf-8");
	 resp.setContentType("text/html;charset=utf-8");
	 HttpSession session = req.getSession(true);
	 
	 
	 String username = req.getParameter("uname");
	 String password = req.getParameter("password");
	 String remember = req.getParameter("passcookies");
	 
	 
	  user =(Users)us.userLoginService(username, password);
	 //登录方法
	 if (us.userLoginService(username, password)!=null) {
		 session.setAttribute("wusername", username);
		 session.setAttribute("wpassword", password);
		 session.setAttribute("uid", user.getUid());
		 session.setAttribute("wuser", user);
		
		//将密码记住在cookie
			if (remember != null) {
				Cookie c1 = new Cookie("username", username);
				Cookie c2 = new Cookie("password", password);
				c1.setMaxAge(1000);
				c2.setMaxAge(1000);//这里设置保存这条Cookie的时间
				resp.addCookie(c1);//添加Cookie
				resp.addCookie(c2);
			} else {
				
				}
			//跳转判断
			
			String jump = String.valueOf(session.getAttribute("jump")) ;
			if (!jump.equals("null")) {
				AddShoppingCart.addshoppingcart(req, resp);
				req.getRequestDispatcher("/page/shopping.jsp").forward(req, resp);
			}else{
				req.getRequestDispatcher("/page/index.jsp").forward(req, resp);
			}
			 
	}
	 else{
		 PrintWriter writer = resp.getWriter();
			writer.write("<script>alert('账号密码错误！');window.location.href='login.jsp';</script>");
			writer.flush();
			writer.close();
	 }
	 
	
	 
	 
	}
	
}
