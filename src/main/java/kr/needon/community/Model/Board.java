package kr.needon.community.Model;

import java.sql.Timestamp;

import lombok.Data;

//=====================================
//클래스 설명 : 게시판 DTO 클래스
//작성자 : 박영기
//=====================================

@Data
public class Board {
	private int no;
	private String subject;
	private String content;
	private byte[] file;
	private String sub_category;
	private String cm_body;
	private int cm_ck;
	private int cm_good;
	private int cm_bad;
	private int parent;
	private int cm_level;
	private int read_count;
	private String ip;
	private int bo_good;
	private int bo_bad;
	private int notice_ck;
	private int wr_no;
	private Timestamp register_date;
	private String category;
}
