package kr.needon.community.Model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FileDownload {
	private String bo_table;
	private int bo_no;
	private String bo_subject;
	private String bo_encode;
	private int bo_download;
	private byte[] bo_filesize;
	private Timestamp bo_datetime;
}
