package com.sr178.iseek.admin.action;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.module.web.action.BaseActionSupport;

public class LoginAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int st;
	private String userName;
	private String passWord;
	public String login(){
		if(st==0){
			return SUCCESS;
		}
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.adminLogin(userName, passWord, ServletActionContext.getRequest().getSession().getId());
		return "ok";
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	
	
	
}
