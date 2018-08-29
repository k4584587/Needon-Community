package kr.needon.community.Model;

import lombok.Data;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
	private String filename;
	private String sub_category;
	private String cm_nick;
	private Timestamp cm_regdate;
	private String cm_body;
	private int cm_count;
	private int cm_good;
	private int cm_bad;
	private int comment_count;
	private String cm_password;
	private int parent;
	private int cm_level;
	private int read_count;
	private String ip;
	private int bo_good;
	private int bo_bad;
	private int notice_ck;
	private int count;
	private String keyword;
	private Timestamp register_date;
	private String category;
	List<String> table_list = new ArrayList<String>();
}
