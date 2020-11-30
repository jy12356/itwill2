package svc.freeboard;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CommentDAO;
import dao.FreeBoardDAO;
import vo.FreeBoardBean;
import java.sql.Connection;

import vo.CommentBean;
// 대댓글 작성 요청
public class CommentReplyService {

	public static boolean replyComment(CommentBean cb) {
		boolean isReplySuccess = false;
		System.out.println("CommentReplyService - replyComment ");
		
		Connection con = getConnection();
		
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		commentDAO.setConnection(con);
		
		int insertCount = commentDAO.insertReplyComment(cb);
		
		if(insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);

		return isReplySuccess;
	}

}





























