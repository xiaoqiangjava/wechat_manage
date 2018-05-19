package com.wechat.cs.core.common.entity;

import java.io.Serializable;
import java.util.Map;

import net.sf.json.JSONObject;

/**
 * 
 * @Title: 基础Entity
 * @Description: 
 * @author milogenius
 * @date 2018年1月24日上午10:12:32  
 *
 */
public class BaseDomain implements Serializable {
	
    private static final long serialVersionUID = 843453100595488313L;
	
	// ===================================
	private Integer  pageNo = 1;// 当前页码数
	private Integer  pageSize = 10;// 每页显示条数
	private Integer pages;//总页数
	private Integer total;//总条数
	// ===================================
	
	private int startSet;//开始记录
	private int endSet; //结束记录 startSet + pageSize
	private String[] ids;
	// ===================================
	
	public Integer getPageNo() {
		return pageNo == null ?1:pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getStartSet() {
		return (getPageNo() - 1) * getPageSize();
	}

	public void setStartSet(int startSet) {
		this.startSet = startSet;
	}

	public int getEndSet() {
		return getStartSet() + getPageSize();
	}

	public void setEndSet(int endSet) {
		this.endSet = endSet;
	}
	
    public String toString() {
    	return JSONObject.fromObject(this).toString();
    }
    public Integer getTotal() {
    	return total;
    }
    public void setTotal(Integer total) {
    	this.total = total;
    }
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	
	public Integer getPages() {
		return pages;
	}
	public void setPages(Integer pages) {
		this.pages = pages;
	}
	
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
