package svc.book;

import java.sql.Connection;

import static db.JdbcUtil.*;
import dao.BookDAO;
import vo.BookBean;

public class BookModifyProService {

	public boolean modifyBook(BookBean bookBean, String title, String isbn) {
		boolean ismodify = false;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		int modyfiySeccess = bookDAO.modifyBook(bookBean,title,isbn);
		if(modyfiySeccess  > 0) {
			ismodify = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return ismodify;
	}

}
