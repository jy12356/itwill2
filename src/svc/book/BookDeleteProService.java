package svc.book;

import java.sql.Connection;

import dao.BookDAO;
import vo.BookBean;

import static db.JdbcUtil.*;

public class BookDeleteProService {

	public boolean bookdelete(int book_num) {
		System.out.println("BookDeleteProService - bookdelete");
		boolean isDelete = false;
		int isDeleteOk = 0;
		Connection con =  getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		
		isDeleteOk = bookDAO.deleteBook(book_num);
		if(isDeleteOk > 0) {
			isDelete = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return isDelete;
	}
	
	public boolean bookExis(int book_num) {
		System.out.println("BookDeleteProService - isBookExis");
		boolean isBookExis = false;
		int isBookExisCount = 0;
		Connection con =  getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		
		isBookExisCount = bookDAO.bookExis(book_num);
		if(isBookExisCount > 0) {
			isBookExis = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return isBookExis;
	}

}
