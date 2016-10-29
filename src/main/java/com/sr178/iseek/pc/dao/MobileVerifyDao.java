package com.sr178.iseek.pc.dao;

import java.util.Date;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.MobileVerify;

public class MobileVerifyDao extends IseekDaoBase<MobileVerify> {
    /**
     * 更新手机验证码
     * @param mobile
     * @param code
     * @return
     */
	public boolean updateVerifyCode(String mobile,String code){
		String sql = " INSERT INTO mobile_verify (mobile,verify_code,updated_time,created_time) VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE verify_code=?,updated_time=?,status=0";
		Date now = new Date();
		return super.getJdbc().update(sql, SqlParameter.Instance().withString(mobile).withString(code).withObject(now).withObject(now).withString(code).withObject(now))>0;
	}
	
	/**
	 * 更新为验证成功
	 * @param mobile
	 * @return
	 */
	public boolean updateSuccess(String mobile){
		String sql = "update mobile_verify set status=1  where mobile=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withString(mobile))>0;
	}
	
	/**
	 * 重置验证码
	 * @param mobile
	 * @return
	 */
	public boolean resetCode(String mobile){
		String sql = "update mobile_verify set status=0,updated_time=null,verify_code=null where mobile=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withString(mobile))>0;
	}
}
