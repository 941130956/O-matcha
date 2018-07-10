package com.omatcha.dao.impl;

import java.util.List;

import com.omatcha.dao.ExpressadressDao;
import com.omatcha.pojo.Expressadress;
import com.omatcha.pojo.Users;
import com.omatcha.util.DButil;

public class ExpressadressImpl implements ExpressadressDao{

	@Override
	public int insertExprssadress(Expressadress exprssadress) {
		String sql = "insert into expressadress(Consignee,ephone,eprovince,ecity,ecountry,eadress) values(?,?,?,?,?,?)";
		String str [] ={exprssadress.getConsignee(),exprssadress.getEphone(),exprssadress.getEprovince(),exprssadress.getEcity(),exprssadress.getEcountry(),exprssadress.getEadress()};
		return DButil.update(sql, str);
	}

	@Override
	public Object selectExprssadress(Users user) {
		String sql = "select * from expressadress where uid=?";
		int str [] ={user.getUid()};
		return DButil.selectSingleObject(sql, Expressadress.class, str);
	}

}
