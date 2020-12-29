package svc.freeboard;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CommentDAO;
import vo.CommentBean;




public class FBCommentListService {

	public int getListCount() {
		System.out.println("FBCommentListService - getListCount()");

		int listCount = 0;
		
		Connection con = getConnection();

		CommentDAO commentDAO = CommentDAO.getInstance();

		commentDAO.setConnection(con);
		
		listCount = commentDAO.selectListCount();
		
		close(con);

		return listCount;
	}

	public ArrayList<CommentBean> getCommentList(int page, int limit, int board_type, int board_num) {
		System.out.println("FBCommentListService - getCommentList()");

		ArrayList<CommentBean> commentList = null;
		
		Connection con = getConnection();
		
		CommentDAO commentDAO = CommentDAO.getInstance();
		
		commentDAO.setConnection(con);
		
		commentList = commentDAO.selectCommentList(page, limit, board_type, board_num);
		
		close(con);
		
		return commentList;
	}

//	public int getMaxSeq() {
//		
//		System.out.println("FBCommentListService - getMaxSeq()");
//
//		int maxSeq = 0;
//		
//		Connection con = getConnection();
//
//		CommentDAO commentDAO = CommentDAO.getInstance();
//
//		commentDAO.setConnection(con);
//		
//		maxSeq = commentDAO.selectMaxSeq();
//		
//		close(con);
//
//		return maxSeq;
//	}

}
