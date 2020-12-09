package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewModifyService {

	public static boolean isReviewWriter(int num, String id) {
		System.out.println("ReviewModifyService - isReviewWriter");
		
		boolean isReviewWriter = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();

		reviewDAO.setConnection(con);
		
		isReviewWriter = reviewDAO.isArticleReviewWriter(num, id);
		
		close(con);
		
		return isReviewWriter;
	}

	public static boolean modifyArticle(ReviewBean article) {
		System.out.println("ReviewModifyService - modifyArticle");
		
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();

		reviewDAO.setConnection(con);
		
		int updateCount = reviewDAO.updateArticle(article);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		return isModifySuccess;
	}
}
