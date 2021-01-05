package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BookDAO;
import dao.ReviewDAO;
import vo.BookBean;
import vo.LikeBean;
import vo.ReviewBean;

public class ReviewLikeCountService {
		
	public boolean ReviewLikeUp(LikeBean likeBean, int num) {
		System.out.println("ReCommentWriteProService - ReviewLikeUp");
		boolean isLikeSuccess = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int insertLike = reviewDAO.insertLikeCount(likeBean);
		if(insertLike > 0) {
			// 좋아요 수 올리기
			int updateCount = reviewDAO.updateLikecount(num);
			if(updateCount  > 0) {
				commit(con);
				isLikeSuccess = true;
			}			
		} else {
			rollback(con);
		}
		close(con);
		
		return isLikeSuccess;
	}

	
	// 좋아요 게시글 확인 후 count 올리기
	public ReviewBean getArticle(int num) {
		System.out.println("ReCommentWriteProService - updateLikeCount");
		Connection con = getConnection();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		reviewDAO.setConnection(con);
		ReviewBean article = reviewDAO.selectArticle(num);
		close(con);
		return article;
	}

	// 좋아요 중복 체크 
	public boolean isLikeWriter(String like_id, int review_num) {
		System.out.println("ReCommentWriteProService - isLikeWriter");
		
		boolean isLikeWriter = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		isLikeWriter = reviewDAO.isArticleLikeWriter(like_id, review_num);
		
		close(con);
		System.out.println("액션으로 돌아감");
		return isLikeWriter;
	}	
}
