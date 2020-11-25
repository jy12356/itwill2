package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.RequestDAO;
import vo.RequestBean;

public class RequestModifyProService {
	
	public boolean isArticleRequestWriter(int num, String id) {
		boolean isArticleRequestWriter = false;
		
		Connection con = getConnection();
		
		RequestDAO requestDAO = RequestDAO.getInstance();
		
		requestDAO.setConnection(con);
		
		isArticleRequestWriter = requestDAO.isArticleRequestWriter(num, id);
		
		close(con);
		
		return isArticleRequestWriter;
	}
	
	public static boolean modifyArticle(RequestBean article) {
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
