package com.omatcha.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.omatcha.pojo.CartGoods;
import com.omatcha.pojo.Users;
import com.omatcha.service.CartService;
import com.omatcha.service.impl.CartServiceImpl;


public class CountServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CartService cs = new CartServiceImpl();
		String sql = "select cgid,cname,sum(quantity) as quantity,weight,price,image,uid from cartgoods where uid=?";
		int count = 0;
		String portrait = null;
		String portraitPath=null;
		HttpSession session = req.getSession();		
		String uid = String.valueOf(session.getAttribute("uid"));
		List list = (List) session.getAttribute("cartgoodslist");
		if(uid.equals("null")){
			if(list!=null){
				session.setAttribute("cartgoodslist", list);
				for (Object obj : list) {
					count+=Integer.parseInt(((CartGoods) obj).getQuantity().toString());
				}
			}
		}else{
			String sql1 = "SELECT cgid,cname,SUM(quantity) as quantity,weight,price,image,uid FROM cartgoods where uid=? GROUP BY cname";
			List cartgoodslist = cs.queryGoods(sql1,Integer.parseInt(uid));
			if(list!=null){
				for (Object obj : list) {
					count+=Integer.parseInt(((CartGoods) obj).getQuantity().toString());
				}
			}	
			session.setAttribute("cartgoodslist", cartgoodslist);				
			portrait = (String) session.getAttribute("portrait");
			if(portrait!=null){			
				portraitPath="<%=path%>/page/tx/"+portrait;
			}					
		}
		Map map = new HashMap();
		map.put("count", count+"");
		map.put("uid", uid);
		map.put("portrait", portraitPath);		
		ObjectMapper om = new ObjectMapper();		
		om.writeValue(resp.getWriter(), map);
		
	}
	
	

}
