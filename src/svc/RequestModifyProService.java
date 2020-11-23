package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.RequestDAO;
import vo.RequestBean;

public class RequestModifyProService {
	public boolean isArticleWriter(int num,  String pass) throws Exception {
		boolean isArticleWriter = false;
		
		Connection con = getConnection();
		
		RequestDAO requestDAO = RequestDAO.getInstance();
		
		requestDAO.setConnection(con);
		
		isArticleWriter = requestDAO.isArticleRequestWriter(num, pass);
		
		close(con);
		
		return isArticleWriter;
	}

	public boolean modifyArticle(RequestBean article) {
		boolean isModifySuccess = true;
		
		Connection con = getConnection();
		
		RequestDAO requestDAO = RequestDAO.getInstance();
		
		requestDAO.setConnection(con);
		
		int updateCount = requestDAO.updateArticle(article);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isModifySuccess;
	}
}
