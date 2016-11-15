package com.sr178.iseek.admin.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;

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
		adminService.deleteNews(ids);
		return this.renderSuccessResult();
   }
   
   /**
	 * 图片上传
	 */
	private List<File> attach;
	private List<String> attachFileName;
	private List<String> attachContentType;
	private String serverFileName;
	private String clientFileName;
	private int type=1;
	public String uploadAttach() {
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/uploads/attach/";
		clientFileName = attachFileName.get(0);
		serverFileName = adminService.saveAttach(type,attach.get(0), attachFileName.get(0), descDirectoryPath);
		return this.renderKeyValueResult("serverFileName", serverFileName);
	}
	
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}

	public List<File> getAttach() {
		return attach;
	}

	public void setAttach(List<File> attach) {
		this.attach = attach;
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
	   
   
}
