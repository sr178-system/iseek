package com.sr178.iseek.pc.bo;

import java.util.Date;

public class UserFileTemp {
	
	private long id;
	private String hash;
	private String name;
	private int type;
	private long size;
	private int timeSpan;
	private int kbps;
	private int srcCount;
	private Date createdTime;
	
	private String subDir;
	private String shareDir;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public int getTimeSpan() {
		return timeSpan;
	}

	public void setTimeSpan(int timeSpan) {
		this.timeSpan = timeSpan;
	}

	public int getKbps() {
		return kbps;
	}

	public void setKbps(int kbps) {
		this.kbps = kbps;
	}

	public int getSrcCount() {
		return srcCount;
	}

	public void setSrcCount(int srcCount) {
		this.srcCount = srcCount;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getSubDir() {
		return subDir;
	}

	public void setSubDir(String subDir) {
		this.subDir = subDir;
	}

	public String getShareDir() {
		return shareDir;
	}

	public void setShareDir(String shareDir) {
		this.shareDir = shareDir;
	}
}
