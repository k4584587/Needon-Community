package kr.needon.community.Model;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class SPageMaker {
	private int totalCount;
	private int startPage;
	private int endPage;
	private int totalPage;
	private boolean next;
	private int start = 1;
	private String category;
	
	private int limit = 10;		// 한 화면에 출력할 레코드 수
	
	private Board board;
	
	public void page() {
		// 총 페이지 수
		totalPage = (int)(Math.ceil(board.getPage() / (double)limit) * limit);
		
		// 시작 페이지 1, 11, 21...
		startPage = (totalPage - limit) + 1;
		
		// 마지막 페이지 10, 20, 30...
		endPage = (int) (Math.ceil(totalCount / (double) board.getPerPageNum()));
		
		if (totalPage > endPage) {
			totalPage = endPage;
		}
		
		next = totalPage * board.getPerPageNum() >= totalCount ? false : true;
	
	}
	
	@Override
	public String toString() {
		return "SPageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalPage=" + totalPage + ", next=" + next + ", start=" + start + ", category=" + category
				+ ", limit=" + limit + ", board=" + board + "]";
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public String uri(int page) {
		UriComponents uriComponets = UriComponentsBuilder.newInstance()
													.queryParam("page", page)												
													.build();
		if(page == 0) {
			UriComponents uriComponets1 = UriComponentsBuilder.newInstance()
					.queryParam("page", 1)
					.build();
			return uriComponets1.toUriString();
		}
		return uriComponets.toUriString();
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		page();
	}
}
