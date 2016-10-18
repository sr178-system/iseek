package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * user_friends 实体类
    */ 


public class UserFriends{
	private int id;
	private long userId;
	private long friendId;
	private Date createdTime;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setUserId(long userId){
	this.userId=userId;
	}
	public long getUserId(){
		return userId;
	}
	public void setFriendId(long friendId){
	this.friendId=friendId;
	}
	public long getFriendId(){
		return friendId;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

