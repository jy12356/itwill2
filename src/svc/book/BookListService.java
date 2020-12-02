package svc.book;

import java.sql.Connection;
import java.util.ArrayList;
import dao.BookDAO;
import vo.BookBean;
import static db.JdbcUtil.*;

public class BookListService {

	public int getListCount() {
		System.out.println("getListCount");
		int listCount=0;
		Connection con= getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		listCount = bookDAO.selectListCount();
		close(con);
		return listCount; 
	}

	public ArrayList<BookBean> getBookList(int page, int limit,String catg1, String catg2) {
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookList = bookDAO.selectBookList(page,limit,catg1,catg2);
		close(con);
		return bookList;
	}

}
