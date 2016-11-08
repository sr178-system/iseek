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

	
}
