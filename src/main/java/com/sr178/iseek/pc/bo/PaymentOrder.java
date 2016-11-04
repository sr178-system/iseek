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
	private long payUserId;
	private int payType;
	private String bankOrderId;
	private int num;
	private double price;
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
	public long getPayUserId() {
		return payUserId;
	}
	public void setPayUserId(long payUserId) {
		this.payUserId = payUserId;
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
	public PaymentOrder(String orderId, long userId, double amount, int status, int payUserId, int payType,
			String bankOrderId, Date updatedTime, Date createdTime) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.amount = amount;
		this.status = status;
		this.payUserId = payUserId;
		this.payType = payType;
		this.bankOrderId = bankOrderId;
		this.updatedTime = updatedTime;
		this.createdTime = createdTime;
	}
	public PaymentOrder() {
		super();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}

