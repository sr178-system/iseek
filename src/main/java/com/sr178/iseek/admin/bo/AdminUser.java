package com.sr178.iseek.admin.bo;

import java.util.Date;
   /**
    * admin_user 实体类
    */ 


public class AdminUser{
	private long userId;
	private String loginName;
	private String name;
	private int sex;
	private String passWord;
	private int status;
	private String power;
	private Date lastLoginTime;
	private Date createdTime;
	public void setUserId(long userId){
	this.userId=userId;
	}
	public long getUserId(){
		return userId;
	}
	public void setLoginName(String loginName){
	this.loginName=loginName;
	}
	public String getLoginName(){
		return loginName;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setSex(int sex){
	this.sex=sex;
	}
	public int getSex(){
		return sex;
	}
	public void setPassWord(String passWord){
	this.passWord=passWord;
	}
	public String getPassWord(){
		return passWord;
	}
	public void setStatus(int status){
	this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setPower(String power){
	this.power=power;
	}
	public String getPower(){
		return power;
	}
	public void setLastLoginTime(Date lastLoginTime){
	this.lastLoginTime=lastLoginTime;
	}
	public Date getLastLoginTime(){
		return lastLoginTime;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

