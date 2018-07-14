package com.omatcha.dao.impl;

import java.util.List;

import com.omatcha.dao.UserDao;
import com.omatcha.pojo.Users;
import com.omatcha.util.DButil;
import com.omatcha.util.MD5Helper;

/**
 * 
 * @author wangwei
 *
 * 用户 业务层实例
 */
public class UserDaoImpl implements UserDao{
	MD5Helper MD5 = new MD5Helper();
	// 用户注册方法（Dao层实例）
	public int signUpDao(Users user) {
		String sql = "insert into user(uname,uphone,email,passwords) values(?,?,?,?)";
		String str [] ={user.getUname(),user.getUphone(),user.getEmail(),MD5.getMDCode(user.getPasswords())};
		return DButil.update(sql, str);
	}

	public List<Object> selectUserName() {
		String sql = "select * from user";
		return  DButil.query(sql,Users.class, null);
	}

	public Object loginDao(String username, String password) {
		String sql = "select * from user where uname=? and passwords= ?";
		String str [] ={username,MD5.getMDCode(password)};
		return DButil.selectSingleObject(sql, Users.class, str);
	}

	@Override
	public int InsertUserList(Users user) {
		String sql = "update  user set Nickname=?,usex=?,birthday=?,uprovince=?,ucity=?,ucountry=?,uadress=? where uid =?";
		String str [] ={user.getNickname(),user.getUsex(),user.getBirthday(),user.getUprovince(),user.getUcity(),user.getUcountry(),user.getUadress(),""+user.getUid()};
		return DButil.update(sql, str);
	}

	@Override
	public int modipwd(Users user) {
		String sql = "update user set passwords = ? where uid =?";
		String str [] ={MD5.getMDCode(user.getPasswords()),""+user.getUid()};
		return DButil.update(sql, str);
	}
	public int forgetpwd(Users user){
		String sql = "update user set passwords = ? where uname =? and uphone=?";
		String str [] ={MD5.getMDCode(user.getPasswords()),user.getUname(),user.getUphone()};
		return DButil.update(sql, str);
	}

}
