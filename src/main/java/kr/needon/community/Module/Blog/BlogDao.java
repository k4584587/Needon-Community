package kr.needon.community.Module.Blog;

import java.util.List;
import kr.needon.community.Model.Blog;
import kr.needon.community.Model.Board;

public interface BlogDao {

    public Blog getBlogInfo(int user_no);
    public List<Board> getBlogTimeLine(Board board);
    public void timeLineInsert(Board board);
    public Board getTimeLineView(Board board);

}
