package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.CommentBean;


public class ReCommentListService {

	public int getCommetListCount() {
		System.out.println("ReCommentListService - 1. getCommetListCount");
		
		int listCount2 = 0;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		listCount2 = reviewDAO.selectCommListCount();
		
		close(con);
		
		return listCount2;
	}

	public ArrayList<CommentBean> getCommArticleList(int page2, int limit2) {
		System.out.println("ReviewListService - 2. getCommArticleList");
		
		ArrayList<CommentBean> articleCommList = null;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		articleCommList = reviewDAO.selectCommentList(page2, limit2);
		
		return articleCommList;
	}

}
