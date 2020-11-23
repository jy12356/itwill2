package svc.freeboard;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.FreeBoardDAO;
import vo.FreeBoardBean;

public class FreeBoardDeleteProService {

	public boolean isArticleWriter(int board_num, String id) {
		System.out.println("isArticleWriter for delete - svc");
		
		boolean isArticleWriter = false;
		
		// 1. Connection
		Connection con = getConnection();
		
		// 2. BoardDAO
		FreeBoardDAO freeBoardDAO = FreeBoardDAO.getInstance();
		
		// 3.BoardDAO에 Connection객체 전달
		freeBoardDAO.setConnection(con);
		
		// 4. BoardDAO에 num, id 비교
		isArticleWriter = freeBoardDAO.isArticleFreeBoardWriter(board_num, id);
		
		// 5. Connection 객체 반환
		close(con);
		
		
		return isArticleWriter;
	}

	public static boolean removeArticle(FreeBoardBean article) {
		System.out.println("removeArticle - svc");
		boolean isDeleteSuccess = true;
		// 1. Connection
		Connection con = getConnection();
		
		// 2. BoardDAO
		FreeBoardDAO freeBoardDAO = FreeBoardDAO.getInstance();
		
		// 3. setConnection
		freeBoardDAO.setConnection(con);
		
		// 4. 
		int deleteCount = freeBoardDAO.removeArticle(article);
		
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		System.out.println("removeArticle - svc - end");
		
		return isDeleteSuccess;
	}


}
