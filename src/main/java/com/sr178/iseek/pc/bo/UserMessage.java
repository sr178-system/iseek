package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * user_message 实体类
    */ 


public class UserMessage{
	private int id;
	private long userId;
	private int type;
	private String content;
	private String url;
	private int readStatus;
	private Date createdDate;
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
	public void setType(int type){
	this.type=type;
	}
	public int getType(){
		return type;
	}
	public void setContent(String content){
	this.content=content;
	}
	public String getContent(){
		return content;
	}
	public void setUrl(String url){
	this.url=url;
	}
	public String getUrl(){
		return url;
	}
	public void setReadStatus(int readStatus){
	this.readStatus=readStatus;
	}
	public int getReadStatus(){
		return readStatus;
	}
	public void setCreatedDate(Date createdDate){
	this.createdDate=createdDate;
	}
	public Date getCreatedDate(){
		return createdDate;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

