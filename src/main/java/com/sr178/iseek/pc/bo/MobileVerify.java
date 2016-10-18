package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * mobile_verify 实体类
    */ 


public class MobileVerify{
	private String mobile;
	private String verifyCode;
	private Date createdTime;
	public void setMobile(String mobile){
	this.mobile=mobile;
	}
	public String getMobile(){
		return mobile;
	}
	public void setVerifyCode(String verifyCode){
	this.verifyCode=verifyCode;
	}
	public String getVerifyCode(){
		return verifyCode;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

