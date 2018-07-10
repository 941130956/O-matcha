package com.omatcha.dao.impl;

import java.util.List;

import com.omatcha.dao.CartDao;
import com.omatcha.pojo.CartGoods;
import com.omatcha.util.DButil;
/***
 * cartDao实现类
 * @author qingxiping
 *
 */
public class CartDaoImpl implements CartDao{

	@Override
	public int addGoods(CartGoods cartGoods) {
		String sql = "insert into cartgoods values (null,?,?,?,?,?,?)";
		Object[] obj = {cartGoods.getName(),cartGoods.getQuantity(),cartGoods.getWeight(),cartGoods.getPrice(),cartGoods.getImage(),cartGoods.getUid()};
		return DButil.update(sql, obj);
	}

	@Override
	public int deleteGoods(int cgid) {
		String sql = "delete from cartgoods where cgid=?";
		return DButil.update(sql, cgid);
	}

	@Override
	public int UpdateGoods(int cgid,int quantity) {
		String sql = "update cartgoods set quantity=? where cgid=?";
		Object[] obj = {quantity,cgid};
		return DButil.update(sql, obj);
	}

	@Override
	public List<Object> queryGoods() {
		String sql = "select * from cartgoods";
		return DButil.query(sql, CartGoods.class, null);
	}

}
