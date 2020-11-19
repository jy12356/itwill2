package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.RequestDAO;
import vo.RequestBean;

public class RequestListService {

	public int getListCount() throws Exception {
		int listCount = 0;

		Connection con = getConnection();

		RequestDAO boardDAO = RequestDAO.getInstance();
				
		// 3(공통). BoardDAO 객체에 Connection 객체 전달
		requestDAO.setConnection(con);

		listCount = boardDAO.selectListCount();

		close(con);

		return listCount;
		
	}
	
	public ArrayList<RequestBean> getArticleList(int page, int limit) throws Exception {
		
		ArrayList<RequestBean> articleList = null;

		Connection con = getConnection();

		RequestDAO requestDAO = RequestDAO.getInstance();

		requestDAO.setConnection(con);

		articleList = requestDAO.selectArticleList(page, limit);

		close(con);

		return articleList;
	}
}
