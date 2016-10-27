package com.sr178.iseek.pc.bean;

public class FilesBO {

	private long file_id;
	private String hash;
	private int type;
	private String name;
	private long size;
	private int time_span;
	private int kbps;
	private int src_count;
	public long getFile_id() {
		return file_id;
	}
	public void setFile_id(long file_id) {
		this.file_id = file_id;
	}
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
	public int getSrc_count() {
		return src_count;
	}
	public void setSrc_count(int src_count) {
		this.src_count = src_count;
	}
	public FilesBO(long file_id, String hash, int type, String name, long size, int time_span, int kbps,
			int src_count) {
		super();
		this.file_id = file_id;
		this.hash = hash;
		this.type = type;
		this.name = name;
		this.size = size;
		this.time_span = time_span;
		this.kbps = kbps;
		this.src_count = src_count;
	}
	public FilesBO() {
		super();
	}
}
