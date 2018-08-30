package kr.needon.community.Module.Blog;

import kr.needon.community.Model.Blog;
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
}
