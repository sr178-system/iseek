package com.sr178.iseek.admin.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.iseek.pc.bo.ChargeConfig;
import com.sr178.iseek.pc.bo.PaymentLogMore;
import com.sr178.module.utils.DateUtils;
import com.sr178.module.web.action.BasePageActionSupport;

public class PayMentLogAction extends BasePageActionSupport<PaymentLogMore> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String loginName;
	private String nickeName;
	private String startChargeDate;
	private String endChargeDate;
	private int datetype;
	private double allfee;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		
		if(datetype==2){
			String now = DateUtils.DateToString(new Date(), "yyyy/MM/dd");
			startChargeDate = now;
			endChargeDate = now;
		}else if(datetype==3){
			String now = DateUtils.DateToString(new Date(), "yyyy/MM/");
			startChargeDate = now+"01";
			endChargeDate = now+"31";
		}
		adminService.checkPower(super.getUserName(), 5);
        super.initPage(adminService.getPagePamentLogList(loginName, nickeName, startChargeDate, endChargeDate, super.getToPage(), 10));
        allfee = adminService.getSum(loginName, nickeName, startChargeDate, endChargeDate);
        startChargeDate=null;
        endChargeDate=null;
        
        return SUCCESS;
	}
	private int st;
	private ChargeConfig config;
	private double feePerMonth;
	private int remindDay;
	public String updatechargeconfig(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.checkPower(super.getUserName(), 6);
		if(st==0){
			config = adminService.getChargeConfig();
			return SUCCESS;
		}
		adminService.updateChargeConfig(feePerMonth, remindDay);
		super.setCode(2000);
		return SUCCESS;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getNickeName() {
		return nickeName;
	}
	public void setNickeName(String nickeName) {
		this.nickeName = nickeName;
	}
	public String getStartChargeDate() {
		return startChargeDate;
	}
	public void setStartChargeDate(String startChargeDate) {
		this.startChargeDate = startChargeDate;
	}
	public String getEndChargeDate() {
		return endChargeDate;
	}
	public void setEndChargeDate(String endChargeDate) {
		this.endChargeDate = endChargeDate;
	}
	public double getAllfee() {
		return allfee;
	}
	public void setAllfee(double allfee) {
		this.allfee = allfee;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public ChargeConfig getConfig() {
		return config;
	}
	public void setConfig(ChargeConfig config) {
		this.config = config;
	}
	public double getFeePerMonth() {
		return feePerMonth;
	}
	public void setFeePerMonth(double feePerMonth) {
		this.feePerMonth = feePerMonth;
	}
	public int getRemindDay() {
		return remindDay;
	}
	public void setRemindDay(int remindDay) {
		this.remindDay = remindDay;
	}
	public int getDatetype() {
		return datetype;
	}
	public void setDatetype(int datetype) {
		this.datetype = datetype;
	}
}
