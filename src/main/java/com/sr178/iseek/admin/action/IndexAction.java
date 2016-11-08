package com.sr178.iseek.admin.action;

import org.apache.struts2.ServletActionContext;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.bo.AdminUser;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.module.web.action.JsonBaseActionSupport;

public class IndexAction extends JsonBaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    /**
     * 主页信息
     */
	private AdminUser adminUser;
	public String execute(){
		this.setErrorResult("success");
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminUser = adminService.getAdminUser(super.getUserName());
		return SUCCESS;
	}
	private String oldpassword;
	private String newpassword;
	/**
	 * 修改密码
	 * @return
	 */
	public String editpassword(){
		this.setErrorResult(JSON);
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.updateAdminUserPassword(super.getUserName(), oldpassword, newpassword);
		return this.renderSuccessResult();
	}
	/**
	 * 登出
	 * @return
	 */
	public String logout(){
		this.setErrorResult("success");
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
        adminService.logout(ServletActionContext.getRequest().getSession().getId());		
		return SUCCESS;
	}
	
	
	public String getOldpassword() {
		return oldpassword;
	}
	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public AdminUser getAdminUser() {
		return adminUser;
	}
	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}
}
