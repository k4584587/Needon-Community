package kr.needon.community.Model;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int totalPage;
	private boolean prev;
	private boolean next;
	
	private int limit = 10;		// 한 화면에 출력할 레코드 수
	
	private Criteria cri;
	
	private void page() {
		// 총 페이지 수
		totalPage = (int)(Math.ceil(cri.getPage() / (double)limit) * limit);
		
		// 시작 페이지 1, 11, 21...
		startPage = (totalPage - limit) + 1;
		
		// 마지막 페이지 10, 20, 30...
		int endPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		
		if (totalPage > endPage) {
			totalPage = endPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		page();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int endPage) {
		this.totalPage = totalPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public Criteria getCri() {
		return cri;
	}
	
}
