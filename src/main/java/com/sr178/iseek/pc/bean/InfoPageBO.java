package com.sr178.iseek.pc.bean;

import java.util.List;

public class InfoPageBO {

	private String big_picture_url;
	private String small_picture_url;
	
	private List<InfoPageLinksBO> links;

	public String getBig_picture_url() {
		return big_picture_url;
	}

	public void setBig_picture_url(String big_picture_url) {
		this.big_picture_url = big_picture_url;
	}

	public String getSmall_picture_url() {
		return small_picture_url;
	}

	public void setSmall_picture_url(String small_picture_url) {
		this.small_picture_url = small_picture_url;
	}

	public List<InfoPageLinksBO> getLinks() {
		return links;
	}

	public void setLinks(List<InfoPageLinksBO> links) {
		this.links = links;
	}
}
