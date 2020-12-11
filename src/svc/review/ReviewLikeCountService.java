package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.LikeBean;

public class ReviewLikeCountService {

	public boolean ReviewLikeUp(LikeBean likeBean) {
		System.out.println("ReCommentWriteProService - getReviewLike");
		
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

	public int ReviewLikeCount() {
		System.out.println("ReCommentWriteProService - ReviewLikeCount");
		
		int likeCount = 0;
		
		return likeCount;
	}

}
