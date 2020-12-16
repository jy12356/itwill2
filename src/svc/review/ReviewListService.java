package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewListService {

	// 서평 등록 수
	public int getListCount(String isbn) {
		System.out.println("ReviewListService - 1. getListCount");
	
		int listCount = 0;
	
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		listCount = reviewDAO.selectListCount(isbn);
		
		close(con);
		
		return listCount;
	}
	
	// 서평 리스트 
	public ArrayList<ReviewBean> getArticleList(int page, int limit, String isbn) {
		System.out.println("ReviewListService - 2. getArticleList");	
		
		ArrayList<ReviewBean> articleList = null;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		articleList = reviewDAO.selectArticleList(page, limit, isbn);
		
		close(con);

		return articleList;
	}

}
