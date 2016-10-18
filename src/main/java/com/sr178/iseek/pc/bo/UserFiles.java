package com.sr178.iseek.pc.bo;

   /**
    * user_files 实体类
    */ 


public class UserFiles{
	private long userId;
	private long fileId;
	private String name;
	private String shareDir;
	private String subDir;
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
}

