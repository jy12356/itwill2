package svc.freeboard;

import java.sql.Connection;

import dao.CommentDAO;
import vo.CommentBean;
import static db.JdbcUtil.*;

public class CommentDetailService {

	public CommentBean getComment(int board_type, int board_num) throws Exception {

		System.out.println("CommentDetailService - getComment");

		Connection con = getConnection();

		CommentDAO commentDAO = CommentDAO.getInstance();

		commentDAO.setConnection(con);

		CommentBean cb = commentDAO.selectComment(board_type, board_num);

//		System.out.println("댓글1의 번호 : " + cb.getComment_num());

		if (cb != null) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return cb;
	}

	public int getCount(int board_type, int board_num) {
		System.out.println("CommentDetailService - getCount");
		
		Connection con = getConnection();

		CommentDAO commentDAO = CommentDAO.getInstance();

		commentDAO.setConnection(con);

		int count = commentDAO.entireCount(board_type, board_num);

		System.out.println("comment getCount 가져온값 : " + count);

		if (count != 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return count;
	}

}
