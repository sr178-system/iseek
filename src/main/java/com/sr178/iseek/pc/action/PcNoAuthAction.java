package com.sr178.iseek.pc.action;

import java.util.HashMap;
import java.util.Map;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.JsonBaseActionSupport;


public class PcNoAuthAction extends JsonBaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 登录接口
	 */
	private String userName;
	private String passWord;
	public String login(){
		Map<String,String> result = new HashMap<String,String>();
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
//		result.put("tokenId", pcService.login(userName, passWord));
        return renderObjectResult(result);
	}
	
	
	
	
	
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}
