package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.RequestDAO;
import vo.RequestBean;

public class RequestDeleteProService {
		
	public boolean removeArticle(RequestBean article) {

		boolean isDeleteSuccess = false;

		Connection con = getConnection();

		RequestDAO requestDAO = RequestDAO.getInstance();

		requestDAO.setConnection(con);

		int deleteCount = requestDAO.deleteArticle(article);

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