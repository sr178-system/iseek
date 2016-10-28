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
	private int searchType;
	private String indexHashTypeSizeTimeSpanKbps;//hash、type、size、time_span、Kbps都相同的文件
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
	public int getSearchType() {
		return searchType;
	}
	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}
	public String getIndexHashTypeSizeTimeSpanKbps() {
		return indexHashTypeSizeTimeSpanKbps;
	}
	public void setIndexHashTypeSizeTimeSpanKbps(String indexHashTypeSizeTimeSpanKbps) {
		this.indexHashTypeSizeTimeSpanKbps = indexHashTypeSizeTimeSpanKbps;
	}
	public Files(String hash, String name, int type, long size, int timeSpan, int kbps, int srcCount, Date createdTime,
			int searchType, String indexHashTypeSizeTimeSpanKbps) {
		super();
		this.hash = hash;
		this.name = name;
		this.type = type;
		this.size = size;
		this.timeSpan = timeSpan;
		this.kbps = kbps;
		this.srcCount = srcCount;
		this.createdTime = createdTime;
		this.searchType = searchType;
		this.indexHashTypeSizeTimeSpanKbps = indexHashTypeSizeTimeSpanKbps;
	}
	public Files() {
		super();
	}
	
}

