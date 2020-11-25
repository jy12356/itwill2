package svc.review;

import java.sql.Connection;

import dao.ReviewDAO;

import static db.JdbcUtil.*;

public class ReviewDeleteProService {

//	public boolean isReviewWriter(int num, String id) {
//		System.out.println("ReviewDeleteProService - isReviewWriter");
//
//		boolean isReviewWriter = false;
//		
//		Connection con = getConnection();
//		
//		ReviewDAO reviewDAO = ReviewDAO.getInstance();
//		
//		reviewDAO.setConnection(con);
//		
//		isReviewWriter = reviewDAO.isArticleReviewWriter(num, id);
//		
//		close(con);
//		
//		return isReviewWriter;	
//	}

	public static boolean removeArticle(int num) {
		System.out.println("ReviewDeleteProService - removeArticle ");
		
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int deleteCount = reviewDAO.deleteArticle(num);
		
		if(deleteCount > 0) {

			commit(con);
			isDeleteSuccess = true;
		} else {

			rollback(con);	
		}
		close(con);
		
		return isDeleteSuccess;
	}

}
