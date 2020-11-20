package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.RequestDAO;
import vo.RequestBean;

public class RequestDetailService {

	public RequestBean getArticle(int num) throws Exception{

		Connection con = getConnection();

		RequestDAO boardDAO = RequestDAO.getInstance();

		requestDAO.setConnection(con);

		RequestBean article = requestDAO.selectArticle(num);

		close(con);
		
		return article;
	}

}
