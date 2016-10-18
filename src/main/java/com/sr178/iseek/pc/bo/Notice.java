package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * notice 实体类
    */ 


public class Notice{
	private int id;
	private String noticeContent;
	private String noticeUrl;
	private Date createdTime;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setNoticeContent(String noticeContent){
	this.noticeContent=noticeContent;
	}
	public String getNoticeContent(){
		return noticeContent;
	}
	public void setNoticeUrl(String noticeUrl){
	this.noticeUrl=noticeUrl;
	}
	public String getNoticeUrl(){
		return noticeUrl;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

