package com.omatcha.service.impl;

import java.util.List;

import com.omatcha.dao.ExpressadressDao;
import com.omatcha.dao.UserDao;
import com.omatcha.dao.impl.ExpressadressImpl;
import com.omatcha.dao.impl.UserDaoImpl;
import com.omatcha.pojo.Expressadress;
import com.omatcha.pojo.Users;
import com.omatcha.service.ExpressadressService;

public class ExpressadressServiceImpl implements ExpressadressService{
	ExpressadressDao expressadressdao = new ExpressadressImpl();
	@Override
	public boolean insertExpressadress(Expressadress expressadress,Users user) {
		int i=expressadressdao.insertExprssadress(expressadress, user);
		if (i>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Object> selectExprssadress(Users user){
		return expressadressdao.selectExprssadress(user);
	}

	
	
	
}
