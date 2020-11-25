package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.RequestDAO;
import vo.RequestBean;

public class RequestDeleteProService {
		
	public boolean isArticleRequestWriter(int num, String id) {
		boolean isArticleRequestWriter = false;
		
		// 1. Connection
		Connection con = getConnection();
		
		// 2. BoardDAO
		RequestDAO requestDAO = RequestDAO.getInstance();
		
		// 3.BoardDAO에 Connection객체 전달
		requestDAO.setConnection(con);
		
		// 4. BoardDAO에 num, id 비교
		isArticleRequestWriter = requestDAO.isArticleRequestWriter(num, id);
		
		// 5. Connection 객체 반환
		close(con);
		
		
		return isArticleRequestWriter;
	}
	
	public boolean removeArticle(RequestBean article) {

		boolean isDeleteSuccess = true;

		Connection con = getConnection();

		RequestDAO requestDAO = RequestDAO.getInstance();

		requestDAO.setConnection(con);

		int deleteCount = requestDAO.removeArticle(article);

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