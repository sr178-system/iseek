package com.sr178.iseek.pc.bean;

public class UpFileBO {

	private String hash;
	private int type;
	private String name;
	private long size;
	private int time_span;
	private int kbps;
	private String share_dir;
	private String sub_dir;
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public int getTime_span() {
		return time_span;
	}
	public void setTime_span(int time_span) {
		this.time_span = time_span;
	}
	public int getKbps() {
		return kbps;
	}
	public void setKbps(int kbps) {
		this.kbps = kbps;
	}
	public String getShare_dir() {
		return share_dir;
	}
	public void setShare_dir(String share_dir) {
		this.share_dir = share_dir;
	}
	public String getSub_dir() {
		return sub_dir;
	}
	public void setSub_dir(String sub_dir) {
		this.sub_dir = sub_dir;
	}
}
