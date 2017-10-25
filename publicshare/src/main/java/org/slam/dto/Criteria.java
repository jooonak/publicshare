package org.slam.dto;

import lombok.extern.java.Log;

@Log
public class Criteria {
	private int page;
	private int total;
	private String condition; 
	private String searchConcept;
	

	public String getSearchConcept() {
		return searchConcept;
	}

	public void setSearchConcept(String searchConcept) {
		this.searchConcept = searchConcept;
	}

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
		return (this.page - 1) * 8;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = '%'+condition+'%';
	}
	
	

//	public String getURI() {
//		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).build();
//		return uriComponents.toUriString();
//
//	}
}
