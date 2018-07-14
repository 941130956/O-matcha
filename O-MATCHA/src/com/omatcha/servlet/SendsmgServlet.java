package com.omatcha.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.omatcha.pojo.Users;
import com.omatcha.util.SendMessage;

public class SendsmgServlet extends HttpServlet{
	String send;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String s,e,n,d;
		Random random = new Random();  
		  s = ""+random.nextInt(10); 
		  e = ""+random.nextInt(10); 
		  n = ""+random.nextInt(10); 
		  d = ""+random.nextInt(10); 
		   send =s+e+n+d;
		  
		  SendMessage sdm = new SendMessage();
		  
		  String phonenum=req.getParameter("modiphone");
		  HttpSession session = req.getSession(true);
		  session.setAttribute("sendmscode", send);
		  System.out.println(send);
		 
		  //sdm.getRequest2(phonenum, send);
		  
		  
		  
		  
		  
			

	 }	

}
