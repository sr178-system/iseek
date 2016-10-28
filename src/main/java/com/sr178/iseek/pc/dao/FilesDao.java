package com.sr178.iseek.pc.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.Files;

public class FilesDao extends IseekDaoBase<Files> {

	public boolean increaseSrcCount(long fileId){
		String sql = "update "+super.getTable()+" set src_count=src_count+1 where id=?";
		return super.getJdbc().update(sql, SqlParameter.Instance().withLong(fileId))>0;
	}
	
	public boolean decreaseSrcCount(long fileId){
		String sql = "update "+super.getTable()+" set src_count=src_count-1 where id=?";
		return super.getJdbc().update(sql, SqlParameter.Instance().withLong(fileId))>0;
	}
}
