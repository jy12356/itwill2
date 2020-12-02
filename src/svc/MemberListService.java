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
		
		// 1(공통). Connection 객체 가져오기
		Connection con = getConnection();
		
		// 2(공통). BoardDAO 객체 가져오기
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 3(공통). BoardDAO 객체에 Connection 객체 전달
		memberDAO.setConnection(con);
		// 4. BoardDAO 객체의 selectListCount() 메서드 호출하여
		//    전체 게시물 수 가져오기
		listCount = memberDAO.selectListCount();
		// 5(공통). Connection 객체 반환하기
		close(con);
		// 6. 전체 게시물 수 리턴
		return listCount;
	
	}

	public static ArrayList<MemberBean> getArticleList(int page, int limit) {
		
		ArrayList<MemberBean> articleList = null;
		
		// 1(공통). Connection 객체 가져오기
		Connection con = getConnection();
		// 2(공통). BoardDAO 객체 가져오기
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 3(공통). BoardDAO 객체에 Connection 객체 전달
		memberDAO.setConnection(con);
		// 4. BoardDAO 객체의 selectAriticleList() 메서드를 호출하여
		//    게시물 목록 조회 결과를 ArrayList 객체로 리턴받기
		//    => 파라미터 : page, limit
		articleList = memberDAO.selectArticleList(page,limit);
		// 5(공통). Connection 객체 반환하기
		close(con);
		// 6. 전체 게시물 수 리턴
		return articleList;
		
	}
}
