package com.sr178.iseek.pc.bean;

public class UserFilesBO extends FilesBO {

	private String sub_dir;
	
	private String share_dir;

	public String getSub_dir() {
		return sub_dir;
	}

	public void setSub_dir(String sub_dir) {
		this.sub_dir = sub_dir;
	}


	public UserFilesBO(long file_id, String hash, int type, String name, long size, int time_span, int kbps,
			int src_count, String sub_dir, String share_dir) {
		super(file_id, hash, type, name, size, time_span, kbps, src_count);
		this.sub_dir = sub_dir;
		this.share_dir = share_dir;
	}

	public UserFilesBO() {
		super();
	}

	public String getShare_dir() {
		return share_dir;
	}

	public void setShare_dir(String share_dir) {
		this.share_dir = share_dir;
	}
	
	
}
