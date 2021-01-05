package svc.returned;

import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReturnedDAO;
import vo.RentalBean;
import vo.ReturnedBean;

public class ReturnedListService {

	public int getListCount() throws Exception{
		System.out.println("returnedListService - getListCount()");
		
		int listCount = 0;

		Connection con = getConnection();
		ReturnedDAO returnedDAO = ReturnedDAO.getInstance();
		returnedDAO.setConnection(con);
		listCount = returnedDAO.selectListCount();
		close(con);
		
		return listCount;
	}

	public ArrayList<ReturnedBean> getArticleList(int page, int limit) throws Exception{
		System.out.println("ReturnedListService - getReturnedList");
		
		ArrayList<ReturnedBean> articleList = new ArrayList<ReturnedBean>();
		Connection con = getConnection();
		ReturnedDAO returnedDAO = ReturnedDAO.getInstance();
		returnedDAO.setConnection(con);
		
		articleList = returnedDAO.selectReturnedList(page, limit);
		close(con);
		return articleList;
	}

}
