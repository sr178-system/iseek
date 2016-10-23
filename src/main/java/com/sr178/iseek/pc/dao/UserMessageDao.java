package com.sr178.iseek.pc.dao;

import java.util.List;
import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.UserMessage;

public class UserMessageDao extends IseekDaoBase<UserMessage> {
    /**
     * 获取用户未读消息
     * @param userId
     * @return
     */
	public List<UserMessage> getUserNotReadMessage(long userId){
		String sql = "select * from "+super.getTable()+" where user_id=? and read_status=0 limit 10";
		return super.getJdbc().getList(sql,UserMessage.class,SqlParameter.Instance().withLong(userId));
	}
	/**
	 * 更新消息为已读
	 * @param messageIds
	 * @return
	 */
	public boolean updateUserMessageToRead(int[] messageIds){
		if(messageIds!=null&&messageIds.length>0){
			String join = "";
			for(int i=0;i<messageIds.length;i++){
				if(i==0){
					join = messageIds[i]+"";
				}else{
					join = join + ","+messageIds[i];
				}
			}
			String sql = "update "+super.getTable()+" set read_status=1 where id in("+join+")";
			return super.getJdbc().update(sql, null)==messageIds.length;
		}
		return false;
	}
}
