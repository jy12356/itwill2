package svc.freeboard;
import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.CommentDAO;


public class CommentDeleteService {

	public boolean removeComment(int comment_num, int board_num, int board_type) {
		System.out.println("CommentDeleteService - removeComment!!");

		boolean isDeleteSuccess = false;

		Connection con = getConnection();

		CommentDAO commentDAO = CommentDAO.getInstance();
		
		commentDAO.setConnection(con);
		
		int deleteCount = commentDAO.removeComment(comment_num, board_type, board_num);
		
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
