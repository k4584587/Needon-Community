package kr.needon.community.Model;

import java.util.Date;

import lombok.Data;

//=====================================
//클래스 설명 : 쪽지 DTO 클래스
//작성자 : 박건우
//=====================================

@Data
public class Message {
	
	private int no;
	private String username;
	private String recv_nick;
	private String send_nick;
	private String you;
	private int count;
	private Date send_date;
	private String content;
	private int read_count;
	private int info_read_count;
	private int page;
	private int perPageNum;
	
	public Message() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	
}
