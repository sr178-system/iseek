package com.sr178.iseek.pc.bean;

public class InfoPageLinksBO {

	private long update_time;
	
	private String text;
	
	private String url;

	public long getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(long update_time) {
		this.update_time = update_time;
	}

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

	public InfoPageLinksBO(long update_time, String text, String url) {
		super();
		this.update_time = update_time;
		this.text = text;
		this.url = url;
	}

	public InfoPageLinksBO() {
		super();
	}
}
