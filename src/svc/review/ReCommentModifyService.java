package svc.review;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.CommentBean;

public class ReCommentModifyService {

	public boolean isCommentWriter(int comment_num, int board_num, int board_type, String comment_id) {
		System.out.println("ReCommentModifyService - isCommentWriter");
		boolean isCommentWriter = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		isCommentWriter = reviewDAO.isArticleCommentWriter(comment_num, board_num, board_type, comment_id);
		
		return isCommentWriter;
	}

	public boolean modifyComment(CommentBean commentBean) {
		System.out.println("ReCommentModifyService - modifyComment");
		
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int updateCount = reviewDAO.updateComment(commentBean);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		return isModifySuccess;
	}

}
