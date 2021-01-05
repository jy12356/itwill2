package svc.review;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReviewDAO;

public class ReCommentDeleteProService {

	public boolean isCommentWriter(int comment_num, int board_num, int board_type, String comment_id) {
		System.out.println("ReCommentDeleteProService - isCommentWriter");
		
		boolean isCommentWriter = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		isCommentWriter = reviewDAO.isArticleCommentWriter(comment_num, board_num, board_type, comment_id);
		
		System.out.println("돌아가는 중");
		return isCommentWriter;
	}

	public static boolean removeComment(int comment_num) {
		System.out.println("ReCommentDeleteProService - removeComment");
		
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int deleteCount = reviewDAO.deleteComment(comment_num);
		
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		close(con);		
		
		System.out.println("액션으로 다시 돌아감");
		return isDeleteSuccess;
	}
	

}
