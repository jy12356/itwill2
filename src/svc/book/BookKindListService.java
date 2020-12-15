package svc.book;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import dao.BookDAO;
import vo.BookBean;

public class BookKindListService {

	public ArrayList<BookBean> bookKindList(String isbn, int page, int limit) {
		System.out.println("BookKindListService - bookKindList");
		ArrayList<BookBean> bookList= new ArrayList<BookBean>();
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		bookList = bookDAO.bookKindList(isbn, page, limit);
		close(con);		
		return bookList;
	}

	public int getListCount(String  isbn) {
		System.out.println("getListCount");
		int listCount=0;
		Connection con= getConnection();
		BookDAO bookDAO = BookDAO.getInstance();		
		bookDAO.setConnection(con);
		listCount = bookDAO.selectListKindCount(isbn);
		close(con);
		return listCount; 
	}

}
