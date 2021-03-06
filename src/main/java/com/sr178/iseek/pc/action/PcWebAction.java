package com.sr178.iseek.pc.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.bo.User;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.BaseActionSupport;

public class PcWebAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int st;
	
    private String password;
    private String newPassword;
	private String nickname;
	private int sex;
	private String email;
	
	private User user;
	/**
	 * 更新用户信息
	 * @return
	 */
	public String updateUserInfo(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		if(st==0){
			user = pcService.getUser(super.getUserId());
			return SUCCESS;
		}else{
			
			pcService.updateUserInfo(super.getUserId(), password, newPassword, nickname, sex, email);
			return "ok";
		}
	}
	private String mobile;
	private String oldCode;
	private String newMobile;
	private String newCode;
	public String changeMobile(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		if(st==0){
			User user = pcService.getUser(super.getUserId());
			mobile = user.getMobile();
			return SUCCESS;
		}else{
			pcService.changeMobile(super.getUserId(),mobile, oldCode, newMobile, newCode);
			return "ok";
		}
	}
    /**
     * 创建订单
     * @return
     */
	private int type;
	private double feePerMonth;
	public String creatOrder() throws IOException{
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		if(st==0){
			feePerMonth = pcService.getFeePerMonth();
			user = pcService.getUser(super.getUserId());
			return SUCCESS;
		}else{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html; charset=UTF-8");
			String orderId = pcService.creatOrder(super.getUserId(),type);
			response.getWriter().println("<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"><title>支付宝即时到账交易接口</title></head>");
			String html = pcService.alipayRequest(orderId);
			response.getWriter().println(html);
			response.getWriter().println("<body></body></html>");
			return null;
		}
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOldCode() {
		return oldCode;
	}
	public void setOldCode(String oldCode) {
		this.oldCode = oldCode;
	}
	public String getNewMobile() {
		return newMobile;
	}
	public void setNewMobile(String newMobile) {
		this.newMobile = newMobile;
	}
	public String getNewCode() {
		return newCode;
	}
	public void setNewCode(String newCode) {
		this.newCode = newCode;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public double getFeePerMonth() {
		return feePerMonth;
	}
	public void setFeePerMonth(double feePerMonth) {
		this.feePerMonth = feePerMonth;
	}
}
