package com.sr178.iseek.admin.action;

import java.util.List;


import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.admin.service.AdminService;
import com.sr178.iseek.pc.bo.News;
import com.sr178.iseek.pc.bo.NewsConfig;
import com.sr178.module.web.action.BaseActionSupport;

public class MessageAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
    private NewsConfig config;
    private List<News> newsList;
	public String execute(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		newsList = adminService.getNewsList();
		config = adminService.getNewsConfig();
		return SUCCESS;
	}
	
	private String content;
	private String url;
	public String addNews(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.addNews(content, url);
		super.setCode(2000);
		return SUCCESS;
	}
	

	public NewsConfig getConfig() {
		return config;
	}
	public void setConfig(NewsConfig config) {
		this.config = config;
	}
	public List<News> getNewsList() {
		return newsList;
	}
	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
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
}
