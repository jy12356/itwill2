package svc.review;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.CommentBean;

public class ReCommentWriteProService {

	public boolean registArticle(CommentBean commentBean) {
		System.out.println("ReCommentWriteProService - registArticle");
		
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		
		reviewDAO.setConnection(con);
		
		int insertCount = reviewDAO.insertComment(commentBean);
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		
		return isWriteSuccess;
	}
	
	

}
