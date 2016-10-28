package com.sr178.iseek.pc.bean;

public class SystemNoticeBO {

	private String notice_content;
	private String url;
	private long created_time;
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public long getCreated_time() {
		return created_time;
	}
	public void setCreated_time(long created_time) {
		this.created_time = created_time;
	}
	public SystemNoticeBO(String notice_content, String url, long created_time) {
		super();
		this.notice_content = notice_content;
		this.url = url;
		this.created_time = created_time;
	}
	public SystemNoticeBO() {
		super();
	}
}
