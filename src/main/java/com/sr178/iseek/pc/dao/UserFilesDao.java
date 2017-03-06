package com.sr178.iseek.pc.dao;

import java.util.List;


import com.google.common.base.Strings;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.game.framework.exception.ServiceException;
import com.sr178.game.framework.log.LogSystem;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.Files;
import com.sr178.iseek.pc.bo.User;
import com.sr178.iseek.pc.bo.UserFileTemp;
import com.sr178.iseek.pc.bo.UserFiles;

public class UserFilesDao extends IseekDaoBase<UserFiles> {

	
	public List<Files> seekFiles(String keyWorld,String fileType,String style_type){
		LogSystem.info("keyWorlds="+keyWorld+",fileType="+fileType+",style_type="+style_type+"");
		if(Strings.isNullOrEmpty(keyWorld)){
			throw new ServiceException(100,"搜索关键字不能为空！");
		}else{
			keyWorld = keyWorld.replace("\\", "\\\\\\\\");
			keyWorld = keyWorld.replace("'", "''");
			keyWorld = keyWorld.replace("%", "\\%");
			keyWorld = keyWorld.replace("_", "\\_");
		}
		LogSystem.info("after replace keyWorlds="+keyWorld+",fileType="+fileType+",style_type="+style_type+"");
		StringBuffer sqlBuffer = new StringBuffer();
		if(fileType.equals("1")){//音频文件
			sqlBuffer.append("select * from files ");
			sqlBuffer.append(" where search_type=1 ");
			
			if(Strings.isNullOrEmpty(style_type)){
				sqlBuffer.append(" and id in(select file_id from user_files where name like '%"+keyWorld+"%')");
			}else{
				sqlBuffer.append(" and id in(select file_id from user_files where name like '%"+keyWorld+"%' and search_type='"+style_type+"')");
			}
		}else if(fileType.equals("2")){//压缩文件
			sqlBuffer.append("select * from files ");
			sqlBuffer.append(" where search_type=2 ");
			if(Strings.isNullOrEmpty(style_type)){
				sqlBuffer.append(" and id in(select file_id from user_files where name like '%"+keyWorld+"%')");
			}else{
				sqlBuffer.append(" and id in(select file_id from user_files where name like '%"+keyWorld+"%' and search_type='"+style_type+"')");
			}
			
		}else if(fileType.equals("3")){//文件专辑
			sqlBuffer.append("select * from files ");
			if(Strings.isNullOrEmpty(style_type)){
			   sqlBuffer.append(" where id in(select file_id from user_files where search_zj like '%"+keyWorld+"%')");
			}else{
				 sqlBuffer.append(" where id in(select file_id from user_files where search_zj like '%"+keyWorld+"%' and search_type='"+style_type+"')");
			}
		}else if(fileType.equals("0")){
			sqlBuffer.append("select * from files ");
			if(Strings.isNullOrEmpty(style_type)){
			sqlBuffer.append(" where id in(select file_id from user_files where search_zj like '%"+keyWorld+"%' union select file_id from user_files where name like '%"+keyWorld+"%')");
			}else{
				sqlBuffer.append(" where id in(select file_id from user_files where search_zj like '%"+keyWorld+"%' and search_type='"+style_type+"'  union select file_id from user_files where name like '%"+keyWorld+"%' and search_type='"+style_type+"')");
			}
		}else{
			throw new RuntimeException("错误的fileType="+fileType);
		}
		sqlBuffer.append(" order by id desc limit 1000");
		String sql = sqlBuffer.toString();
		LogSystem.info("keyWorlds="+keyWorld+",fileType="+fileType+",style_type="+style_type+"|"+"sql = "+sql);
		return super.getJdbc().getList(sql, Files.class);
	}
	
	/**
	 * 获取文件所有者
	 * @param fileId
	 * @return
	 */
	public List<User> getFileOwnerList(long fileId){
		String sql = "select * from user where user_id in(select user_id from user_files where file_id=? order by created_time desc) limit 1000";
		return super.getJdbc().getList(sql, User.class, SqlParameter.Instance().withLong(fileId));
	}
	/**
	 * 获取用户文件信息
	 * @param userId
	 * @return
	 */
	public List<UserFileTemp> getUserFileTempInfo(long userId){
		String sql = "select f.id,f.hash,f.type,f.size,f.time_span,f.kbps,f.src_count,uf.name,uf.sub_dir,uf.share_dir,uf.created_time from user_files uf left join files f on uf.file_id=f.id where uf.user_id=? ";
		return super.getJdbc().getList(sql, UserFileTemp.class,SqlParameter.Instance().withLong(userId));
	}
	
	public void insertLists(List<UserFiles> list){
		super.getJdbc().insert(list);
	}
	
	public static void main(String[] args) {
		String keyWord = "_";
		System.out.println(keyWord.replace("_", "\\_"));
	}
}
