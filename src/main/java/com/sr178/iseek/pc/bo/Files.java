package com.sr178.iseek.pc.bo;

import java.util.Date;
   /**
    * files 实体类
    */ 


public class Files{
	private long id;
	private String hash;
	private String name;
	private int type;
	private long size;
	private int timeSpan;
	private int kbps;
	private int srcCount;
	private Date createdTime;
	public void setId(long id){
	this.id=id;
	}
	public long getId(){
		return id;
	}
	public void setHash(String hash){
	this.hash=hash;
	}
	public String getHash(){
		return hash;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setType(int type){
	this.type=type;
	}
	public int getType(){
		return type;
	}
	public void setSize(long size){
	this.size=size;
	}
	public long getSize(){
		return size;
	}
	public void setTimeSpan(int timeSpan){
	this.timeSpan=timeSpan;
	}
	public int getTimeSpan(){
		return timeSpan;
	}
	public void setKbps(int kbps){
	this.kbps=kbps;
	}
	public int getKbps(){
		return kbps;
	}
	public void setSrcCount(int srcCount){
	this.srcCount=srcCount;
	}
	public int getSrcCount(){
		return srcCount;
	}
	public void setCreatedTime(Date createdTime){
	this.createdTime=createdTime;
	}
	public Date getCreatedTime(){
		return createdTime;
	}
}

