package svc.freeboard;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.CommentDAO;
import vo.CommentBean;

public class CommentModifyService {

	public boolean modifyComment(CommentBean cb) {
		System.out.println("CommentModifyService - modifyComment");

		boolean isModifySuccess = true;
		
		Connection con = getConnection();

		CommentDAO commentDAO = CommentDAO.getInstance();
		
		commentDAO.setConnection(con);
		
		int updateCount = commentDAO.updateComment(cb);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		close(con);
		System.out.println("CommentModifyService - end");

		return isModifySuccess;
	}

}





























