package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * payment_log 实体类
    */ 


public class PaymentLog{
	private int id;
	private long userId;
	private String orderId;
	private double amount;
	private Date beforVipTime;
	private Date afterVipTime;
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
	public void setOrderId(String orderId){
	this.orderId=orderId;
	}
	public String getOrderId(){
		return orderId;
	}
	public void setAmount(double amount){
	this.amount=amount;
	}
	public double getAmount(){
		return amount;
	}
	public void setBeforVipTime(Date beforVipTime){
	this.beforVipTime=beforVipTime;
	}
	public Date getBeforVipTime(){
		return beforVipTime;
	}
	public void setAfterVipTime(Date afterVipTime){
	this.afterVipTime=afterVipTime;
	}
	public Date getAfterVipTime(){
		return afterVipTime;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

