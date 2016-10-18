package com.sr178.iseek.pc.bo;

   /**
    * version 实体类
    */ 


public class Version{
	private int versionNum;
	private String urlandtype;
	private int updateFlag;
	public void setVersionNum(int versionNum){
	this.versionNum=versionNum;
	}
	public int getVersionNum(){
		return versionNum;
	}
	public void setUrlandtype(String urlandtype){
	this.urlandtype=urlandtype;
	}
	public String getUrlandtype(){
		return urlandtype;
	}
	public void setUpdateFlag(int updateFlag){
	this.updateFlag=updateFlag;
	}
	public int getUpdateFlag(){
		return updateFlag;
	}
}

