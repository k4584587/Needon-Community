package kr.needon.community.Model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Blog {

    private int no;
    private int user_no;
    private String blog_title;
    private byte[] blog_bg;
    private String blog_category;
    private Timestamp register_date;

}
