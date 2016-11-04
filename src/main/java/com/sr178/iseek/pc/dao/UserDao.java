package com.sr178.iseek.pc.dao;

import java.util.Date;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.User;

public class UserDao extends IseekDaoBase<User> {
	/**
	 * 更新用户的共享文件个数
	 * @param userId
	 * @param count
	 * @return
	 */
	public boolean updateUserShareFileCount(long userId,int count){
		String sql = "update "+super.getTable()+" set share_file_count = ? where user_id=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withInt(count).withLong(userId))>0;
	}
	
	/**
	 * 更新用户登录时间
	 * @param userId
	 * @param loginTime
	 * @return
	 */
	public boolean updateUserLoginTime(long userId,Date loginTime){
		String sql = "update "+super.getTable()+" set last_login_time = ? where user_id=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(loginTime).withLong(userId))>0;
	}
	
	/**
	 * 设置当前登录传输key
	 * @param userId
	 * @param transferKey
	 * @return
	 */
	public boolean updateTransferKey(long userId,String transferKey){
		String sql = "update " + super.getTable() +" set transfer_key = ? where user_id=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withString(transferKey).withLong(userId))>0;
		
	}
	/**
	 * 更新用户信息
	 * @param userId
	 * @param nickerName
	 * @param email
	 * @param sex
	 * @param password
	 * @return
	 */
	public boolean updateUserInfo(long userId,String nickerName,String email,int sex,String password){
		String sql = "update " + super.getTable() +" set nick_name = ?,email=?,sex=?";
		SqlParameter parameter = SqlParameter.Instance().withString(nickerName).withString(email).withInt(sex);
		if(!Strings.isNullOrEmpty(password)){
			sql = sql + ",pass_word=?";
			parameter = parameter.withString(password);
		}
		sql = sql +" where user_id=? limit 1";
		parameter = parameter.withLong(userId);
		return super.getJdbc().update(sql,parameter)>0;
	}
	/**
	 * 修改用户手机号码
	 * @param userId
	 * @param mobile
	 * @return
	 */
	public boolean updateUserMobile(long userId,String mobile){
		String sql = "update " + super.getTable() +" set mobile = ? where user_id=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withString(mobile).withLong(userId))>0;
	}
	/**
	 * 修改会员时间
	 * @param userId
	 * @param date
	 * @return
	 */
	public boolean updateMemberExpireTime(long userId,Date date){
		String sql = "update " + super.getTable() +" set member_expiry_day = ? where user_id=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withObject(date).withLong(userId))>0;
	}
}
