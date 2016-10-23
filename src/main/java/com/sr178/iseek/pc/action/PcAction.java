package com.sr178.iseek.pc.action;


import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.web.action.JsonBaseActionSupport;

public class PcAction extends JsonBaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 获取单点登陆字符串
	 * @return
	 */
	public String getssostr(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return this.renderKeyValueResult("sso_str", pcService.getssostr(super.getTokenId()));
	}
	/**
	 * 获取用户消息（10秒调用一次）
	 * @return
	 */
	public String getnotice(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return this.renderListResult(pcService.getnotice(super.getTokenId()));
	}
}
