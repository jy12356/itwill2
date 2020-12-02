package svc.request;

import java.sql.Connection;

import dao.RequestDAO;
import vo.RequestBean;

import static db.JdbcUtil.*;


public class RequestWriteProService {

	public boolean registArticle(RequestBean requestBean) throws Exception {
		System.out.println("RequestWriteProService - registArticle()");
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		
		RequestDAO requestDAO = RequestDAO.getInstance();
		
		requestDAO.setConnection(con);
		
		int insertCount = requestDAO.insertArticle(requestBean);
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);

		return isWriteSuccess;
	}
	
}

