package com.sr178.iseek.pc.bean;

public class NoticeBO {

	private int type;//1：会员续费或充值成功提醒，2：会员到期提醒，3：公告信息
	private String notice;////消息内容
	private String url;//可选，链接URL
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public NoticeBO(int type, String notice, String url) {
		super();
		this.type = type;
		this.notice = notice;
		this.url = url;
	}
	public NoticeBO() {
		super();
	}
}
