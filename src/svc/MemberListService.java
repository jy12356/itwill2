package svc;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberListService {
	public int getListCount() throws Exception {
		System.out.println("MemberListService - getListCount");
		int listCount = 0;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		listCount = memberDAO.selectListCount();
		close(con);
		System.out.println("MemberListService - getListCount 종료");
		return listCount;
	
	}

	public static ArrayList<MemberBean> getArticleList(int page, int limit) {
		System.out.println("MemberListService - getArticleList");
		ArrayList<MemberBean> articleList = null;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		articleList = memberDAO.selectArticleList(page,limit);
		close(con);
		System.out.println("MemberListService - getArticleList 종료");
		return articleList;
		
	}
}
