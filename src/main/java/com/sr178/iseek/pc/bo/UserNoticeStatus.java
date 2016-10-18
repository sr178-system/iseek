package com.sr178.iseek.pc.bo;

   /**
    * user_notice_status 实体类
    */ 


public class UserNoticeStatus{
	private long userId;
	private int noticeId;
	public void setUserId(long userId){
	this.userId=userId;
	}
	public long getUserId(){
		return userId;
	}
	public void setNoticeId(int noticeId){
	this.noticeId=noticeId;
	}
	public int getNoticeId(){
		return noticeId;
	}
}

