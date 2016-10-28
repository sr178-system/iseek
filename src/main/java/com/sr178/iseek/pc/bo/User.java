package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * user 实体类
    */ 


public class User{
	private long userId;
	private String loginName;
	private String nickName;
	private int sex;
	private String passWord;
	private String mobile;
	private String email;
	private Date memberExpiryDay;
	private int status;
	private int shareCompress;
	private int shareFileCount;
	private Date lastLoginTime;
	private String transferKey;
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
	public void setNickName(String nickName){
	this.nickName=nickName;
	}
	public String getNickName(){
		return nickName;
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
	public void setMobile(String mobile){
	this.mobile=mobile;
	}
	public String getMobile(){
		return mobile;
	}
	public void setEmail(String email){
	this.email=email;
	}
	public String getEmail(){
		return email;
	}
	public void setMemberExpiryDay(Date memberExpiryDay){
	this.memberExpiryDay=memberExpiryDay;
	}
	public Date getMemberExpiryDay(){
		return memberExpiryDay;
	}
	public void setStatus(int status){
	this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setShareCompress(int shareCompress){
	this.shareCompress=shareCompress;
	}
	public int getShareCompress(){
		return shareCompress;
	}
	public void setShareFileCount(int shareFileCount){
	this.shareFileCount=shareFileCount;
	}
	public int getShareFileCount(){
		return shareFileCount;
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
	public String getTransferKey() {
		return transferKey;
	}
	public void setTransferKey(String transferKey) {
		this.transferKey = transferKey;
	}
}

