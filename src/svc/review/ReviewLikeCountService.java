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

	
	// 좋아요 게시글 확인 후 count 올리기
	public ReviewBean getArticle(int num) {
		System.out.println("ReCommentWriteProService - updateLikeCount");
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		ReviewBean article = reviewDAO.selectArticle(num);
		
		if(article != null) { // 게시물 상세 내용이 리턴되었을 경우(= 조회 성공)
			// 좋아요 수 올리기
			int updateCount = reviewDAO.updateLikecount(num);
			
			if(updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		close(con);
		
		return null;
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
		
		return isLikeWriter;
	}	
}
