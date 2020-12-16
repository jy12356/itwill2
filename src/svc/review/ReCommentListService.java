package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.CommentBean;
import vo.ReviewBean;


public class ReCommentListService {

	// 서평 게시물 확인
	public int getListCount(int board_num, int board_type) {
		
		int listCount = 0;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		listCount = reviewDAO.selectListCount(board_num, board_type);
		
		close(con);
		
		return listCount;
	}

	// 서평 리스트 
	public ArrayList<CommentBean> getArticleList(int page, int limit, int board_num, int board_type) {
		System.out.println("ReviewListService - 2. getArticleList");	

		ArrayList<CommentBean> articleList = null;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		articleList = reviewDAO.selectArticleList(page, limit, board_num, board_type);
		
		close(con);

		return articleList;
	}

}
