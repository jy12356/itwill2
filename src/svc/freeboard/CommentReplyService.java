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

//	public int getMaxSeq(int board_num, int board_type, int comment_num) {
//		System.out.println("CommentReplyService - getMaxSeq");
//		
//		Connection con = getConnection();
//
//		CommentDAO commentDAO = CommentDAO.getInstance();
//
//		commentDAO.setConnection(con);
//
//		int maxSeq = commentDAO.getMaxSeq(board_num, board_type, comment_num);
//
//		System.out.println("comment getMaxSeq 가져온값 : " + getMaxSeq);
//
//	
//
//		close(con);
//
//		return maxSeq;
//	}

}





























