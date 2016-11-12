package com.sr178.iseek.pc.dao;

import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.PaymentLog;
import com.sr178.iseek.pc.bo.PaymentLogMore;

public class PaymentLogDao extends IseekDaoBase<PaymentLog> {

	
	public IPage<PaymentLogMore> getPageList(String loginName,String nickeName,String startChargeDate,String endChargeDate,int pageIndex,int pageSize){
		String sql = "select p.*,u.login_name,u.nick_name,u.mobile from "+super.getTable()+" p left join user u on p.user_id=u.user_id where 1=1";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(loginName)){
			if(!Strings.isNullOrEmpty(nickeName)){
				sql = sql + " and p.user_id in(select user_id from user where login_name=? and nick_name=?)";
				parameter.withString(loginName).withString(nickeName);
			}else{
				sql = sql + " and p.user_id in(select user_id from user where login_name=?)";
				parameter.withString(loginName);
			}
		}else{
			if(!Strings.isNullOrEmpty(nickeName)){
				sql = sql + " and p.user_id in(select user_id from user where nick_name=?)";
				parameter.withString(nickeName);
			}
		}
		
		if(!Strings.isNullOrEmpty(startChargeDate)&&!Strings.isNullOrEmpty(endChargeDate)){
			sql = sql +" and p.created_time between ? and ?";
			parameter.withString(startChargeDate).withString(endChargeDate);
		}
		sql = sql + " order by p.created_time desc";
		return super.getJdbc().getListPage(sql, PaymentLogMore.class, parameter, pageSize, pageIndex);
	}
	
	
	public double getSumAmount(String loginName,String nickeName,String startChargeDate,String endChargeDate){
		String sql = "select sum(amount) from "+super.getTable()+"  where 1=1";
		SqlParameter parameter = SqlParameter.Instance();
		if(!Strings.isNullOrEmpty(loginName)){
			if(!Strings.isNullOrEmpty(nickeName)){
				sql = sql + " and user_id in(select user_id from user where login_name=? and nick_name=?)";
				parameter.withString(loginName).withString(nickeName);
			}else{
				sql = sql + " and user_id in(select user_id from user where login_name=?)";
				parameter.withString(loginName);
			}
		}else{
			if(!Strings.isNullOrEmpty(nickeName)){
				sql = sql + " and user_id in(select user_id from user where nick_name=?)";
				parameter.withString(nickeName);
			}
		}
		
		if(!Strings.isNullOrEmpty(startChargeDate)&&!Strings.isNullOrEmpty(endChargeDate)){
			sql = sql +" and created_time between ? and ?";
			parameter.withString(startChargeDate).withString(endChargeDate);
		}
		return this.getJdbc().getDouble(sql, parameter);
	}
}
