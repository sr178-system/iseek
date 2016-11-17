package com.sr178.iseek.admin.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.module.web.action.JsonBaseActionSupport;

public class CustomerJsonAction extends JsonBaseActionSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private long[] ids;
	private int status;
    public String del(){
    	AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
    	adminService.checkPower(super.getUserName(), 2);
    	adminService.deleteAdminUser(ids);
    	return this.renderSuccessResult();
    }
    
    public String editStatus(){
    	AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
    	adminService.checkPower(super.getUserName(), 2);
    	adminService.updateAdminUserStatus(ids, status);
    	return this.renderSuccessResult();
    }

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public long[] getIds() {
		return ids;
	}

	public void setIds(long[] ids) {
		this.ids = ids;
	}
}
