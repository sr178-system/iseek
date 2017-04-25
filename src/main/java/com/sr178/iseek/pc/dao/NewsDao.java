package com.sr178.iseek.pc.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.News;

public class NewsDao extends IseekDaoBase<News> {

	public boolean updateNews(int id,String content,String url){
		String sql = "update "+super.getTable()+" set new_title=?,news_url=? where news_id=? limit 1";
		SqlParameter parameter = SqlParameter.Instance().withString(content).withString(url).withInt(id);
		return super.getJdbc().update(sql, parameter)>0;
	}
}
