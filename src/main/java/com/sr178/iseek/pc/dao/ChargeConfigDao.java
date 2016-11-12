package com.sr178.iseek.pc.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.ChargeConfig;

public class ChargeConfigDao extends IseekDaoBase<ChargeConfig> {

	
	public boolean update(double feePerMonth,int remindDay){
		String sql = "update "+ super.getTable()+" set fee_per_month=? ,remind_day=? limit 1";
		SqlParameter parameter = SqlParameter.Instance();
		parameter.withDouble(feePerMonth).withInt(remindDay);
		return this.getJdbc().update(sql, parameter)>0;
	}
}
