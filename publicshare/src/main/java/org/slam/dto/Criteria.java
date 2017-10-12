package org.slam.dto;

import lombok.extern.java.Log;

@Log
public class Criteria {
	private int page;
	private int total;

	public Criteria() {
		this(1);
	}
	
	public Criteria(int page) {

		if (page <= 0) {
			page = 1;
		}
		this.page = page;
	}


	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			page = 1;
		}
		this.page = page;
	}


	public int getSkip() {
		return (this.page - 1) * 10;
	}

//	public String getURI() {
//		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).build();
//		return uriComponents.toUriString();
//
//	}
}
