package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * news_config 实体类
    */ 


public class NewsConfig{
	private int id;
	private String bigPictureUrl;
	private String smallPictureUrl;
	private Date updatedTime;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setBigPictureUrl(String bigPictureUrl){
	this.bigPictureUrl=bigPictureUrl;
	}
	public String getBigPictureUrl(){
		return bigPictureUrl;
	}
	public void setSmallPictureUrl(String smallPictureUrl){
	this.smallPictureUrl=smallPictureUrl;
	}
	public String getSmallPictureUrl(){
		return smallPictureUrl;
	}
	public void setUpdatedTime(Date updatedTime){
	this.updatedTime=updatedTime;
	}
	public Date getUpdatedTime(){
		return updatedTime;
	}
}

