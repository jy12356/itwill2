package svc.book;

import java.sql.Connection;
import java.util.ArrayList;
import dao.BookDAO;
import vo.BookBean;
import static db.JdbcUtil.*;

public class MainListService {

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

	public ArrayList<BookBean> getBookList(int page, int limit,String catg1, String catg2,String search) {
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookList = bookDAO.selectBookList(page,limit,catg1,catg2,search);
		close(con);
		System.out.println("MainListService 끝");
		return bookList;
	}
	
	public ArrayList<BookBean> getBookList2(int page, int limit,String catg1, String catg2) {
		ArrayList<BookBean> bookList2 = new ArrayList<BookBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookList2 = bookDAO.selectBookList2(page,limit,catg1,catg2);
		close(con);
		System.out.println("servicesize" + bookList2.size());
		System.out.println("MainListService2 끝");
		return bookList2;
	}

	public ArrayList<BookBean> getBookList3(int page, int limit,String catg1, String catg2) {
		ArrayList<BookBean> bookList3 = new ArrayList<BookBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookList3 = bookDAO.selectBookList3(page,limit,catg1,catg2);
		close(con);
		System.out.println("servicesize" + bookList3.size());
		System.out.println("MainListService2 끝");
		return bookList3;
	}
	
	public ArrayList<BookBean> getBookList4(int page, int limit,String catg1, String catg2) {
		ArrayList<BookBean> bookList4 = new ArrayList<BookBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookList4 = bookDAO.selectBookList4(page,limit,catg1,catg2);
		close(con);
		System.out.println("servicesize" + bookList4.size());
		System.out.println("MainListService4 끝");
		return bookList4;
	}
	
	public ArrayList<BookBean> getBookList5(int page, int limit) {
		ArrayList<BookBean> bookList5 = new ArrayList<BookBean>();
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		bookDAO.setConnection(con);
		bookList5 = bookDAO.selectBookList5(page,limit);
		close(con);
		System.out.println("servicesize" + bookList5.size());
		System.out.println("MainListService5 끝");
		return bookList5;
	}
	

}
