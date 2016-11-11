package com.sr178.iseek.admin.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.bo.AdminUser;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.module.web.action.BasePageActionSupport;

public class CustomerAction extends BasePageActionSupport<AdminUser> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	

	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getAdminUserPage(super.getToPage(), 10));
		return SUCCESS;
	}

	private String username;
	private String password;
	private String name;
	private int sex;
	private int[] power;
	
	private int st;
	private AdminUser adminUser;
	public String customerEdit(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(st==0){
			adminUser = adminService.getAdminUser(username);
			return SUCCESS;
		}
		adminService.updateAdminUser(username, password, name, sex, power);
		super.setCode(2000);
		return SUCCESS;
	}
	
	public String customerAdd(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(st==0){
			return SUCCESS;
		}
		adminService.addAdminUser(username, password, name, sex, power);
		super.setCode(2000);
		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}
	public int[] getPower() {
		return power;
	}

	public void setPower(int[] power) {
		this.power = power;
	}

	public int getSt() {
		return st;
	}

	public void setSt(int st) {
		this.st = st;
	}

	public AdminUser getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}
}
