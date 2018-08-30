package kr.needon.community.Module.Blog;

import java.util.List;
import kr.needon.community.Model.Blog;
import kr.needon.community.Model.Board;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlogDAOImpl implements BlogDao {

    @Autowired
    SqlSession session;

    private static String namespace = "Blog";

    @Override
    public Blog getBlogInfo(int user_no) {
        return session.selectOne(namespace + ".getBlogInfo", user_no);
    }

    @Override
    public List<Board> getBlogTimeLine(Board board) {
        return session.selectList(namespace+".getBlogTimeLine", board);
    }

    @Override
    public void timeLineInsert(Board board) {
        session.insert(namespace + ".timeLineInsert", board);
    }

    @Override
    public Board getTimeLineView(Board board) {
        return session.selectOne(namespace + ".getTimeLineView", board);
    }


}
