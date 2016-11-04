package com.sr178.iseek.pc.dao;

import java.util.List;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.Friend;
import com.sr178.iseek.pc.bo.UserFriends;

public class UserFriendsDao extends IseekDaoBase<UserFriends> {

	
	public List<Friend> getFriendList(long userId){
		String sql = "select u.user_id,u.login_name,u.nick_name from user_friends f left join user u on f.friend_id=u.user_id where f.user_id=? ";
	    return super.getJdbc().getList(sql, Friend.class,SqlParameter.Instance().withLong(userId));
	}
}
