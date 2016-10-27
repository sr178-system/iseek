package com.sr178.iseek.common.session;

import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.sr178.iseek.pc.bean.NoticeBO;

public class IseekSession {

	private String trasferKey;
	
	private String userName;
	
	private int maxNoticeKey;
	
	private List<NoticeBO> notices = Lists.newArrayList();

	public String getTrasferKey() {
		return trasferKey;
	}

	public void setTrasferKey(String trasferKey) {
		this.trasferKey = trasferKey;
	}

	public List<NoticeBO> getNotices() {
		return notices;
	}

	public void addNoticeBO(NoticeBO noticeBo){
		notices.add(noticeBo);
	}
	
	public void resetNoticeList(){
		notices = Lists.newArrayList();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public IseekSession(String trasferKey, String userName) {
		super();
		this.trasferKey = trasferKey;
		this.userName = userName;
	}

	public IseekSession() {
		super();
	}

	public int getMaxNoticeKey() {
		return maxNoticeKey;
	}

	public void setMaxNoticeKey(int maxNoticeKey) {
		this.maxNoticeKey = maxNoticeKey;
	}
}
