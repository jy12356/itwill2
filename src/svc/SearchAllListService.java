package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.SearchAllDAO;
import vo.BookBean;
import vo.FreeBoardBean;
import vo.NoticeBean;
import vo.QnaBean;

import static db.JdbcUtil.*;

public class SearchAllListService {

	public static ArrayList<BookBean> getBookSearchAllList(String search) {
		System.out.println("SearchAllListService - getBookSearchAllList");
		ArrayList<BookBean> bookAllList = new ArrayList<BookBean>();
		SearchAllDAO searchAllDAO = SearchAllDAO.getInstance();
		Connection con = getConnection();
		searchAllDAO.setConnection(con);
		bookAllList = searchAllDAO.selectBookAllList(search);
		close(con);
		return bookAllList;
	}

	public static ArrayList<FreeBoardBean> getFreeSearchAllList(String search) {
		System.out.println("SearchAllListService - getFreeSearchAllList");
		ArrayList<FreeBoardBean> noticeAllList = new ArrayList<FreeBoardBean>();
		SearchAllDAO searchAllDAO = SearchAllDAO.getInstance();
		Connection con = getConnection();
		searchAllDAO.setConnection(con);
		noticeAllList = searchAllDAO.selectFreeBAllList(search);
		close(con);
		return noticeAllList;
	}

	public static ArrayList<QnaBean> getNoticeSearchAllList(String search) {
		System.out.println("SearchAllListService - getNoticeSearchAllList");
		ArrayList<QnaBean> qnaAllList = new ArrayList<QnaBean>();
		SearchAllDAO searchAllDAO = SearchAllDAO.getInstance();
		Connection con = getConnection();
		searchAllDAO.setConnection(con);
		qnaAllList = searchAllDAO.selecQnaAllList(search);
		close(con);
		return qnaAllList;
	}

	public static ArrayList<NoticeBean> selectNoticeAllList(String search) {
		System.out.println("SearchAllListService - selectNoticeAllList");
		ArrayList<NoticeBean> noticeAllList = new ArrayList<NoticeBean>();
		SearchAllDAO searchAllDAO = SearchAllDAO.getInstance();
		Connection con = getConnection();
		searchAllDAO.setConnection(con);
		noticeAllList = searchAllDAO.selectNoticeAllList(search);
		close(con);
		return noticeAllList;
	}

}
