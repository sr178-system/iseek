package com.sr178.iseek.pc.action;


import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.JsonBaseActionSupport;


public class PcNoAuthAction extends JsonBaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 版本更新
	 * @return
	 */
	private int client_ver;//客户端版本号
	public String update(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return renderObjectResult(pcService.checkVersion(client_ver));
	}
	/**
	 * 登录接口
	 */
	private String login_name;
	private String login_str;
	public String login(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
        return renderObjectResult(pcService.login(login_name, login_str));
	}
	
	/**
	 * 获取资讯首页信息
	 * @return
	 */
	public String getinfopage(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
        return renderObjectResult(pcService.getInfoPageBO());
	}
	
	
	
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_str() {
		return login_str;
	}
	public void setLogin_str(String login_str) {
		this.login_str = login_str;
	}
	public int getClient_ver() {
		return client_ver;
	}
	public void setClient_ver(int client_ver) {
		this.client_ver = client_ver;
	}
	
}
