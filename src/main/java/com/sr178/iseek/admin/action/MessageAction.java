package com.sr178.iseek.admin.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;

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
		adminService.checkPower(super.getUserName(), 8);
		newsList = adminService.getNewsList();
		config = adminService.getNewsConfig();
		return SUCCESS;
	}
	
	private String content;
	private String url;
	public String addNews(){
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.checkPower(super.getUserName(), 8);
		adminService.addNews(content, url);
		super.setCode(2000);
		return SUCCESS;
	}
	

	
	/**
	 * 图片上传
	 */
	private List<String> attachFileName;
	private List<String> attachContentType;
	private String serverFileName;
	private String clientFileName;
	private int type = 1;
	private List<File> attach;
	

	public String uploadAttach() {
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		adminService.checkPower(super.getUserName(), 8);
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/uploads/attach/";
		clientFileName = attachFileName.get(0);
		serverFileName = adminService.saveAttach(type, attach.get(0), attachFileName.get(0), descDirectoryPath);
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

	public List<String> getAttachFileName() {
		return attachFileName;
	}

	public void setAttachFileName(List<String> attachFileName) {
		this.attachFileName = attachFileName;
	}

	public List<String> getAttachContentType() {
		return attachContentType;
	}

	public void setAttachContentType(List<String> attachContentType) {
		this.attachContentType = attachContentType;
	}

	public String getServerFileName() {
		return serverFileName;
	}

	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}

	public String getClientFileName() {
		return clientFileName;
	}

	public void setClientFileName(String clientFileName) {
		this.clientFileName = clientFileName;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<File> getAttach() {
		return attach;
	}

	public void setAttach(List<File> attach) {
		this.attach = attach;
	}


}
