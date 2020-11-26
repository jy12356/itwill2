package svc.freeboard;

import java.sql.Connection;

import dao.FreeBoardDAO;

import static db.JdbcUtil.*;
import vo.CommentBean;

public class CommentWriteProService {

	public boolean registComment(CommentBean commentBean) {

		System.out.println("CommentWriteProService - registComment()");
		
		boolean isWriteSuccess = false;
		
		Connection con = getConnection();
		
		FreeBoardDAO freeBoardDAO = FreeBoardDAO.getInstance();
		
		freeBoardDAO.setConnection(con);
		
		int insertCount = freeBoardDAO.insertComment(commentBean);
		
		if(insertCount > 0) {
			commit(con); // DB 커밋 작업 수행
			isWriteSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		
		return isWriteSuccess;
	}


}
