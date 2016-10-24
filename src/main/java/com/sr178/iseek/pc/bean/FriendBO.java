package com.sr178.iseek.pc.bean;

public class FriendBO {

	private long friend_id;
	
	private String login_name;
	
	private String nickname;

	public long getFriend_id() {
		return friend_id;
	}

	public void setFriend_id(long friend_id) {
		this.friend_id = friend_id;
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

	public FriendBO(long friend_id, String login_name, String nickname) {
		super();
		this.friend_id = friend_id;
		this.login_name = login_name;
		this.nickname = nickname;
	}

	public FriendBO() {
		super();
	}
}
