package com.sr178.iseek.admin.dao;

import java.util.Date;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.admin.bo.AdminUser;
import com.sr178.iseek.common.dao.IseekDaoBase;

public class AdminUserDao extends IseekDaoBase<AdminUser> {

	
	/**
	 * 更新用户登录时间
	 * @param userId
	 * @param loginTime
	 * @return
	 */
	public boolean updateUserLoginTime(String userName,Date loginTime){
		String sql = "update "+super.getTable()+" set last_login_time = ? where login_name=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(loginTime).withString(userName))>0;
	}
	
	/**
	 * 修改密码
	 * @param userName
	 * @param pasword
	 * @return
	 */
	public boolean updateUserPassword(String userName,String pasword){
		String sql = "update "+super.getTable()+" set pass_word = ? where login_name=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(pasword).withString(userName))>0;
	}
	/**
	 * 更新用户信息
	 * @param userName
	 * @param password
	 * @param name
	 * @param sex
	 * @param power
	 * @return
	 */
	public boolean updateAdminUser(String userName,String password,String name,int sex,String power){
		String sql = "update "+super.getTable()+" set name = ?,sex=?,power=?" ;
		SqlParameter paramer = SqlParameter.Instance().withString(name).withInt(sex).withString(power);
		if(!Strings.isNullOrEmpty(password)){
			sql = sql +",pass_word = ?";
			paramer.withString(password);
		}
		sql = sql + "where login_name=? limit 1";
		paramer.withString(userName);
		return super.getJdbc().update(sql, paramer)>0;
	}
	/**
	 * 更新用户状态
	 * @param userId
	 * @param status
	 * @return
	 */
	public boolean updateStatus(long userId,int status){
		String sql = "update "+super.getTable()+" set status = ? where user_id=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withInt(status).withLong(userId))>0;
	}
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	public boolean delete(long userId){
		String sql = "delete from "+super.getTable()+"  where user_id=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withLong(userId))>0;
	}
}
