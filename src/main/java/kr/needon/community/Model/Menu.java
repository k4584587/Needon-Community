package kr.needon.community.Model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class Menu {

    private int id;
    private int menu_id;
    private String category_name;
    private String category_link;
    private int main_count;
    private int sub_count;
    private int sub_category_count;
    private int new_tab_count;
    private int main_category_id;
    private int insert_count;
    private Timestamp register_date;

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", category_name='" + category_name + '\'' +
                ", category_link='" + category_link + '\'' +
                ", main_count=" + main_count +
                ", sub_count=" + sub_count +
                ", sub_category_count=" + sub_category_count +
                ", new_tab_count=" + new_tab_count +
                ", main_category_id=" + main_category_id +
                ", insert_count=" + insert_count +
                ", register_date=" + register_date +
                '}';
    }
}
