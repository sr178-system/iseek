package com.sr178.iseek.admin.dao;

import java.util.Date;

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
}
