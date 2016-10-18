package com.sr178.iseek.pc.bean;

import java.util.List;

public class UpdateBO {

	private int update_flag;
	
	private List<UpdatePackageBO> update_file;

	public int getUpdate_flag() {
		return update_flag;
	}

	public void setUpdate_flag(int update_flag) {
		this.update_flag = update_flag;
	}

	public List<UpdatePackageBO> getUpdate_file() {
		return update_file;
	}

	public void setUpdate_file(List<UpdatePackageBO> update_file) {
		this.update_file = update_file;
	}
}
