package com.sr178.iseek.pc.bean;

public class UserInfoBO {

	private String login_name;
	
	private String nickname;
	
	private int sex;
	
	private String mobile;
	
	private String email;
	
	private long member_expiry_day;
	
	private int share_compress;

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

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMember_expiry_day() {
		return member_expiry_day;
	}

	public void setMember_expiry_day(long member_expiry_day) {
		this.member_expiry_day = member_expiry_day;
	}

	public int getShare_compress() {
		return share_compress;
	}

	public void setShare_compress(int share_compress) {
		this.share_compress = share_compress;
	}

	public UserInfoBO(String login_name, String nickname, int sex, String mobile, String email, long member_expiry_day,
			int share_compress) {
		super();
		this.login_name = login_name;
		this.nickname = nickname;
		this.sex = sex;
		this.mobile = mobile;
		this.email = email;
		this.member_expiry_day = member_expiry_day;
		this.share_compress = share_compress;
	}

	public UserInfoBO() {
		super();
	}
}
