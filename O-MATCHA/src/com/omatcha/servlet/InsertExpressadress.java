package com.omatcha.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.omatcha.pojo.Expressadress;
import com.omatcha.pojo.Users;
import com.omatcha.service.ExpressadressService;
import com.omatcha.service.impl.ExpressadressServiceImpl;

public class InsertExpressadress extends HttpServlet{
	ExpressadressService ea = new ExpressadressServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session = req.getSession(true);
		Users user = (Users) session.getAttribute("wuser");
		String consignee = req.getParameter("Consignee");
		String ephone = req.getParameter("ephone");
		String eprovince = req.getParameter("cmbProvince");
		String ecity = req.getParameter("cmbCity");
		String earea = req.getParameter("cmbArea");
		String eadress = req.getParameter("eadress");
		
		Expressadress expressadress = new Expressadress();
		expressadress.setConsignee(consignee);
		expressadress.setEphone(ephone);
		expressadress.setEprovince(eprovince);
		expressadress.setEcity(ecity);
		expressadress.setEcountry(earea);
		expressadress.setEadress(eadress);
		
		if (ea.insertExpressadress(expressadress,user)) {
			session.setAttribute("crconsignee", consignee);
			session.setAttribute("crephone", ephone);
			session.setAttribute("creprovince", eprovince);
			session.setAttribute("crecity", ecity);
			session.setAttribute("crearea", earea);
			session.setAttribute("creadress", eadress);
			
		}
		
		
		
	}
	
	

}
