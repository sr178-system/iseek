package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * payment_order 实体类
    */ 


public class PaymentOrder{
	private int id;
	private String orderId;
	private long userId;
	private double amount;
	private int status;
	private int payUserId;
	private int payType;
	private String bankOrderId;
	private Date updatedTime;
	private Date createdTime;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setOrderId(String orderId){
	this.orderId=orderId;
	}
	public String getOrderId(){
		return orderId;
	}
	public void setUserId(long userId){
	this.userId=userId;
	}
	public long getUserId(){
		return userId;
	}
	public void setAmount(double amount){
	this.amount=amount;
	}
	public double getAmount(){
		return amount;
	}
	public void setStatus(int status){
	this.status=status;
	}
	public int getStatus(){
		return status;
	}
	public void setPayUserId(int payUserId){
	this.payUserId=payUserId;
	}
	public int getPayUserId(){
		return payUserId;
	}
	public void setPayType(int payType){
	this.payType=payType;
	}
	public int getPayType(){
		return payType;
	}
	public void setBankOrderId(String bankOrderId){
	this.bankOrderId=bankOrderId;
	}
	public String getBankOrderId(){
		return bankOrderId;
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

