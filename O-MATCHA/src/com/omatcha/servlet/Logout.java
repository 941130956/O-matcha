package com.omatcha.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 退出
 * @param request
 * @param response
 * @throws ServletException
 * @throws IOException
 */
public class Logout extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session!=null){
			session.removeAttribute("wuser");
			session.invalidate();//使session失效
			session = null;
		}
		resp.sendRedirect(req.getContextPath()+"/page/login.jsp");
	}
	
}
	
	
	
	


