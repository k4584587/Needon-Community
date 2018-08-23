package kr.needon.community.Model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoTable {

    private int no;
    private String bo_title;
    private int read_p;
    private int write_p;
    private int cm_p;
    private int down_p;
    private Timestamp register_date;

}
