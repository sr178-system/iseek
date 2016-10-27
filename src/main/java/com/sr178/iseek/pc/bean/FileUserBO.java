package com.sr178.iseek.pc.bean;

public class FileUserBO {

	private long user_id;
	private String login_name;
	private String nickname;
	private int share_file_count;
	private int is_friend;
	
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
	public FileUserBO(long user_id, String login_name, String nickname, int share_file_count, int is_friend) {
		super();
		this.user_id = user_id;
		this.login_name = login_name;
		this.nickname = nickname;
		this.share_file_count = share_file_count;
		this.is_friend = is_friend;
	}
	public FileUserBO() {
		super();
	}
}
