package kr.needon.community.Model;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	
	private int no;
	private String username;
	private String you;
	private Date send_date;
	private String content;
	private int read_count;
	
}
