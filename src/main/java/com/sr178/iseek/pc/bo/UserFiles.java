package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * user_files 实体类
    */ 


public class UserFiles{
	private long userId;
	private long fileId;
	private String name;
	private String shareDir;
	private String subDir;
	private String searchType;
	private String searchZj;
	private Date createdTime;
	public void setUserId(long userId){
	this.userId=userId;
	}
	public long getUserId(){
		return userId;
	}
	public void setFileId(long fileId){
	this.fileId=fileId;
	}
	public long getFileId(){
		return fileId;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setShareDir(String shareDir){
	this.shareDir=shareDir;
	}
	public String getShareDir(){
		return shareDir;
	}
	public void setSubDir(String subDir){
	this.subDir=subDir;
	}
	public String getSubDir(){
		return subDir;
	}
	public void setSearchZj(String searchZj){
	this.searchZj=searchZj;
	}
	public String getSearchZj(){
		return searchZj;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public UserFiles(long userId, long fileId, String name, String shareDir, String subDir, String searchType,
			String searchZj, Date createdTime) {
		super();
		this.userId = userId;
		this.fileId = fileId;
		this.name = name;
		this.shareDir = shareDir;
		this.subDir = subDir;
		this.searchType = searchType;
		this.searchZj = searchZj;
		this.createdTime = createdTime;
	}
	public UserFiles() {
		super();
	}
	
}

