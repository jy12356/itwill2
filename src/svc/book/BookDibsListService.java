package svc.book;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookInterestBean;

public class BookDibsListService {

	public int getBookListDibsCount(String id) {
		System.out.println("getBookListDibsCount");
		int listCount=0;
		Connection con= getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		listCount = bookDAO.selectListDibsCount(id);
		close(con);
		return listCount; 
	}

	public ArrayList<BookInterestBean> getBookListDibsList(int page, int limit, String id) {
		ArrayList<BookInterestBean> bookDibsList = new ArrayList<BookInterestBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookDibsList = bookDAO.selectBookListDibsList(page,limit,id);
		close(con);
		return bookDibsList;
	}


}
