package com.sr178.iseek.pc.bean;

public class SystemNoticeBO2 {

	private String text;
	private String url;

	
	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public SystemNoticeBO2(String text, String url) {
		super();
		this.text = text;
		this.url = url;
	}


	public SystemNoticeBO2() {
		super();
	}
}
