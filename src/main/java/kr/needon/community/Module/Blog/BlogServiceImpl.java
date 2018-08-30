package kr.needon.community.Module.Blog;

import kr.needon.community.Model.Board;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class BlogServiceImpl implements BlogService {

    @Inject
    BlogDAOImpl dao;

    @Override
    public boolean timeLineInsert(Board board) {

        try {
            dao.timeLineInsert(board);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
