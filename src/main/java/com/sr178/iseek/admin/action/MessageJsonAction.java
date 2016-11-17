package com.sr178.iseek.admin.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.module.web.action.JsonBaseActionSupport;

public class MessageJsonAction extends JsonBaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
   private int[] ids;
   /**
    * 删除资讯
    * @return
    */
   public String deleteNews(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.checkPower(super.getUserName(), 8);
		adminService.deleteNews(ids);
		return this.renderSuccessResult();
   }
   
	
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}
}
