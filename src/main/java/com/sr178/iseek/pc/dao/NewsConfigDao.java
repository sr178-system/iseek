package com.sr178.iseek.pc.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.NewsConfig;

public class NewsConfigDao extends IseekDaoBase<NewsConfig> {

	
	public boolean updateSmallPicUrl(String smallPicUrl){
		String sql = "update "+super.getTable()+" set small_picture_url=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withString(smallPicUrl))>0;
	}
	
	public boolean updateBigPicUrl(String bigPicUrl){
		String sql = "update "+super.getTable()+" set big_picture_url=? limit 1";
		return super.getJdbc().update(sql, SqlParameter.Instance().withString(bigPicUrl))>0;
	}
}
