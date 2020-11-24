package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewListService {

	public int getListCount() {
		System.out.println("ReviewListService - 1. getListCount");
	
		int listCount = 0;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		listCount = reviewDAO.selectListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<ReviewBean> getArticleList(int page, int limit) {
		System.out.println("ReviewListService - 2. getArticleList");
		
		ArrayList<ReviewBean> articleList = null;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		articleList = reviewDAO.selectArticleList(page, limit);
		
		close(con);

		return articleList;
	}
}
