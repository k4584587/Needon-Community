package kr.needon.community.Model;

import lombok.Data;

import java.sql.Timestamp;

//=====================================
//클래스 설명 : 게시판 DTO 클래스
//작성자 : 박영기
//=====================================

@Data
public class Board {
	private int no;
	private String subject;
	private String content;
	private String wr_nick;
	private String wr_password;
	private byte[] file;
	private String sub_category;
	private int cm_no;
	private String cm_nick;
	private Timestamp cm_regdate;
	private String cm_body;
	private int cm_count;
	private int cm_good;
	private int cm_bad;
	private String cm_password;
	private int parent;
	private int cm_level;
	private int read_count;
	private String ip;
	private int bo_good;
	private int bo_bad;
	private int notice_ck;
	private Timestamp register_date;
	private String category;
}
