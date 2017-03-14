package com.sr178.iseek.pc.action;


import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.iseek.pc.bean.SystemNoticeBO;
import com.sr178.iseek.pc.bo.Notice;
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
	
	private String key_word;
	private String file_type;
	private String style_type;
	/**
	 * 搜索文件
	 * @return
	 */
	public String seekfile(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		
		if(Strings.isNullOrEmpty(file_type)){
			file_type="0";
		}
		
		return this.renderListResult(pcService.seekFileList(Long.valueOf(super.getTokenId()), key_word, file_type, style_type));
	}
	private long file_id;
	/**
	 * 获取文件所有者
	 * @return
	 */
	public String getfileowners(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return this.renderListResult(pcService.getfileowners(Long.valueOf(super.getTokenId()), file_id));
	}
	
	private long files_owner_user_id;
	/**
	 * 获取用户文件列表
	 * @return
	 */
	public String seekfilebyuser(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		return this.renderListResult(pcService.getUserFilesBO(files_owner_user_id));
	}
	private String files;
	/**
	 * 同步文件信息
	 * @return
	 */
	public String putfilesinfo(){
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		pcService.upFiles(Long.valueOf(super.getTokenId()), files);
		return this.renderSuccessResult();
	}
	/**
	 * 获取系统公告
	 * @return
	 */
	public String getsysnotice(){
        PcService pcService = ServiceCacheFactory.getService(PcService.class);
		Notice notice = pcService.getMaxKeyNotice();
		SystemNoticeBO bo = null;
		if(notice!=null){
			bo = new SystemNoticeBO(notice.getNoticeContent(), notice.getNoticeUrl(), notice.getCreatedTime().getTime());
		}
		return this.renderObjectResult(bo);
	}
	
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
	public String getKey_word() {
		return key_word;
	}
	public void setKey_word(String key_word) {
		this.key_word = key_word;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getStyle_type() {
		return style_type;
	}
	public void setStyle_type(String style_type) {
		this.style_type = style_type;
	}
	public long getFile_id() {
		return file_id;
	}
	public void setFile_id(long file_id) {
		this.file_id = file_id;
	}
	public long getFiles_owner_user_id() {
		return files_owner_user_id;
	}
	public void setFiles_owner_user_id(long files_owner_user_id) {
		this.files_owner_user_id = files_owner_user_id;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
}
