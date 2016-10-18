package com.sr178.iseek.pc.bo;

   /**
    * charge_config 实体类
    */ 


public class ChargeConfig{
	private double feePerMonth;
	private int remindDay;
	public void setFeePerMonth(double feePerMonth){
	this.feePerMonth=feePerMonth;
	}
	public double getFeePerMonth(){
		return feePerMonth;
	}
	public void setRemindDay(int remindDay){
	this.remindDay=remindDay;
	}
	public int getRemindDay(){
		return remindDay;
	}
}

