package com.sr178.iseek.pc.bean;

public class FileUserBO {

	private long user_id;
	private String login_name;
	private String nickname;
	private int share_file_count;
	private int is_friend;
	private String share_dir;
	private String sub_dir;
	private String file_name;
	
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getShare_file_count() {
		return share_file_count;
	}
	public void setShare_file_count(int share_file_count) {
		this.share_file_count = share_file_count;
	}
	public int getIs_friend() {
		return is_friend;
	}
	public void setIs_friend(int is_friend) {
		this.is_friend = is_friend;
	}
	public FileUserBO(long user_id, String login_name, String nickname, int share_file_count, int is_friend,String file_name) {
		super();
		this.user_id = user_id;
		this.login_name = login_name;
		this.nickname = nickname;
		this.share_file_count = share_file_count;
		this.is_friend = is_friend;
		this.file_name = file_name;
	}
	public FileUserBO() {
		super();
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
}
