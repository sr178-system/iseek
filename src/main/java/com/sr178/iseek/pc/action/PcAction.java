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
	/**
	 * 获取用户信息
	 * @return
	 */
	public String getuserinfo(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return this.renderObjectResult(pcService.getUserInfo(Long.valueOf(super.getTokenId())));
	}
	
	/**
	 * 获取好友列表
	 * @return
	 */
	public String getfriends(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return this.renderObjectResult(pcService.getFriendBOList(Long.valueOf(super.getTokenId())));
	}
	/**
	 * 关注或取消关注好友
	 */
	private String friend_id;//关注或取消对象的id
	private String is_friend;//1：关注，2：取消关注  
	public String setfriend(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		pcService.setFriends(Long.valueOf(super.getTokenId()), Long.valueOf(friend_id), is_friend);
		return this.renderSuccessResult();
	}
	
//	private String key_word;
//	private String file_type;
//	public String seekfile(){
//		
//		
//	}
	
	public String getFriend_id() {
		return friend_id;
	}
	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}
	public String getIs_friend() {
		return is_friend;
	}
	public void setIs_friend(String is_friend) {
		this.is_friend = is_friend;
	}
}
