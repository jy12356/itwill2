package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.LikeBean;
import vo.ReviewBean;

public class ReviewLikeCountService {
		
	public boolean ReviewLikeUp(LikeBean likeBean) {
		System.out.println("ReCommentWriteProService - ReviewLikeUp");
		boolean isLikeSuccess = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int insertLike = reviewDAO.insertLikeCount(likeBean);
		
		if(insertLike > 0) {
			commit(con);
			isLikeSuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		
		return isLikeSuccess;
	}


	public boolean getArticle(int num) throws Exception {
		System.out.println("ReCommentWriteProService - getArticle");
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		ReviewBean article = reviewDAO.selectArtticle(num);
		
		return false;
	}


}
