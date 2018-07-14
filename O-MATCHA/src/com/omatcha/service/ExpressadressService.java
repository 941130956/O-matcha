package com.omatcha.service;

import java.util.List;

import com.omatcha.pojo.Expressadress;
import com.omatcha.pojo.Users;


public interface ExpressadressService {
	public boolean insertExpressadress(Expressadress expressadress,Users user);
	public List<Object> selectExprssadress(Users user);
	
	
}
