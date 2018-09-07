package kr.needon.community.Model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoTable {

    private int no;
    private String bo_table;
    private String bo_title;
    private String bo_category;
    private String bo_admin;
    private String bo_read_role;
    private String bo_write_role;
    private String bo_info;
    private String content;
    private int bo_category_count;
    private int read_p;
    private int write_p;
    private int cm_p;
    private int down_p;
    private int category_no;
    private Timestamp register_date;

}
