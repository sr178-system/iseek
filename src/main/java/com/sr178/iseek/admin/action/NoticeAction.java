package com.sr178.iseek.admin.action;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.iseek.pc.bo.Notice;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.BaseActionSupport;

public class NoticeAction extends BaseActionSupport{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private String content;
    private String url;
    private int st;
    private Notice notice;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.checkPower(super.getUserName(), 7);
		if(st==0){
			PcService pcService = ServiceCacheFactory.getService(PcService.class);
			notice = pcService.getMaxKeyNotice();
			return SUCCESS;
		}

		adminService.updateNotice(content, url);
		super.setCode(2000);
		return SUCCESS;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getSt() {
		return st;
	}
	public void setSt(int st) {
		this.st = st;
	}
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
}
