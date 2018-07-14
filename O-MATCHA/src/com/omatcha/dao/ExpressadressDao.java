package com.omatcha.dao;

import java.util.List;

import com.omatcha.pojo.Expressadress;
import com.omatcha.pojo.Users;

public interface ExpressadressDao {
		//新增地址
		public int insertExprssadress(Expressadress exprssadress,Users user);	
		//查询已有地址
		public List<Object> selectExprssadress(Users user);
}
