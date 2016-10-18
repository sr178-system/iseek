package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * news 实体类
    */ 


public class News{
	private int newsId;
	private String newTitle;
	private String newsUrl;
	private Date updatedTime;
	private Date createdTime;
	public void setNewsId(int newsId){
	this.newsId=newsId;
	}
	public int getNewsId(){
		return newsId;
	}
	public void setNewTitle(String newTitle){
	this.newTitle=newTitle;
	}
	public String getNewTitle(){
		return newTitle;
	}
	public void setNewsUrl(String newsUrl){
	this.newsUrl=newsUrl;
	}
	public String getNewsUrl(){
		return newsUrl;
	}
	public void setUpdatedTime(Date updatedTime){
	this.updatedTime=updatedTime;
	}
	public Date getUpdatedTime(){
		return updatedTime;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

