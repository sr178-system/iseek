package com.sr178.iseek.admin.action;

import java.util.Date;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.iseek.pc.bo.User;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.utils.DateUtils;
import com.sr178.module.web.action.BasePageActionSupport;

public class UserAction extends BasePageActionSupport<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String loginname;
	private String nickename;
	private int type=1;
	private int datetype=1;
	private String startRegDate;
	private String endRegDate;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		if(datetype==2){
			String now = DateUtils.DateToString(new Date(), "yyyy/MM/dd");
			startRegDate = now;
			endRegDate = now;
		}else if(datetype==3){
			String now = DateUtils.DateToString(new Date(), "yyyy/MM/");
			startRegDate = now+"01";
			endRegDate = now+"31";
		}
		adminService.checkPower(super.getUserName(), 3);
		super.initPage(adminService.getUserList(loginname, nickename,type, startRegDate, endRegDate, super.getToPage(), 10));
		startRegDate=null;
		endRegDate= null;
		return SUCCESS;
	}
	
	
	
	private int st;
	private String password;
	private int sex;
	private String email;
	private String mobile;
	public String addUser(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.checkPower(super.getUserName(), 4);
		if(st==0){
			return SUCCESS;
		}
		adminService.addUserByAdmin(loginname, password, nickename, sex, email, mobile,memberExpireTimeStr);
		super.setCode(2000);
		return SUCCESS;
	}
	
	private long userid;
	private User user;
	private String memberExpireTimeStr;
	public String editUser(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.checkPower(super.getUserName(), 4);
		if(st==0){
			PcService pcService = ServiceCacheFactory.getService(PcService.class);
			user = pcService.getUser(userid);
			return SUCCESS;
		}
		adminService.updateUserInfoByAdmin(userid, nickename, email, mobile, sex, password, memberExpireTimeStr);
		super.setCode(2000);
		return SUCCESS;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getNickename() {
		return nickename;
	}
	public void setNickename(String nickename) {
		this.nickename = nickename;
	}
	public String getStartRegDate() {
		return startRegDate;
	}
	public void setStartRegDate(String startRegDate) {
		this.startRegDate = startRegDate;
	}
	public String getEndRegDate() {
		return endRegDate;
	}
	public void setEndRegDate(String endRegDate) {
		this.endRegDate = endRegDate;
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMemberExpireTimeStr() {
		return memberExpireTimeStr;
	}
	public void setMemberExpireTimeStr(String memberExpireTimeStr) {
		this.memberExpireTimeStr = memberExpireTimeStr;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getDatetype() {
		return datetype;
	}
	public void setDatetype(int datetype) {
		this.datetype = datetype;
	}
}
