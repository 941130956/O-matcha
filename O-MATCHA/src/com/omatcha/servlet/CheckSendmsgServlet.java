package com.omatcha.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class CheckSendmsgServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inputmsgcode=req.getParameter("msgcode");
		HttpSession session =  req.getSession();
		Map<String,Integer> map=new HashMap<String, Integer>();
		inputmsgcode.length();
		String sendcd = (String) session.getAttribute("sendmscode");
		System.out.println(sendcd);
		if (inputmsgcode.length()>0&&sendcd!=null) {
			if(sendcd.equals(inputmsgcode)){
    		 map.put("msg",1);
			}
			else{
        	 map.put("msg",2);
			}
		}
		System.out.println(map);
    	ObjectMapper om = new ObjectMapper();
    	om.writeValue(resp.getWriter(), map);
		
		
		
		
		
	}
	
	
	
}
