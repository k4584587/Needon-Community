package kr.needon.community.Model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Menu {

    private int id;
    private String category_name;
    private String category_link;
    private int main_count;
    private int sub_count;
    private int sub_category_count;
    private int new_tab_count;
    private int main_category_id;
    private int insert_count;
    private Timestamp register_date;


}
