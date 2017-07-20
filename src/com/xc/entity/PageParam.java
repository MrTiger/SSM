package com.xc.entity;

import java.util.List;

public class PageParam {
	private int currPage;
	
	private int totalPage;
	
	private int rowCount;
	
	private int pageSize;
	
	private List<User> data;

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		int totalPage=rowCount/pageSize;
		if(rowCount/pageSize > 0 )
			totalPage+=1;
		setTotalPage(totalPage);
		this.rowCount = rowCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<User> getData() {
		return data;
	}

	public void setData(List<User> data) {
		this.data = data;
	}
	
	
	
}
