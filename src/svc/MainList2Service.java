package svc.book;

import java.sql.Connection;
import java.util.ArrayList;
import dao.BookDAO;
import vo.BookBean;
import static db.JdbcUtil.*;

public class MainList2Service {

	public int getList2Count() {
		System.out.println("getList2Count");
		int list2Count=0;
		Connection con= getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		list2Count = bookDAO.selectListCount();
		close(con);
		return list2Count; 
	}

	public ArrayList<BookBean> getBookList2(int page, int limit,String catg1, String catg2) {
		ArrayList<BookBean> bookList2 = new ArrayList<BookBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookList2 = bookDAO.selectBookList2(page,limit,catg1,catg2);
		close(con);
		System.out.println("MainList2Service 끝");
		return bookList2;
	}


	

}
