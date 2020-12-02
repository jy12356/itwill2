package svc.book;

import vo.BookBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BookDAO;
public class BookDetailService {

	public BookBean getBookInfo(String book_isbn) {
		System.out.println("BookDetailService - getBookInfo");
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		BookBean bookbean = bookDAO.getBookInfo(book_isbn);
		close(con);
		return bookbean;
	}
	
}
