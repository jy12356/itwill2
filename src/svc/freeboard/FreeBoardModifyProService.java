package svc.freeboard;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.FreeBoardDAO;
import vo.FreeBoardBean;

public class FreeBoardModifyProService {

	public boolean isArticleWriter(int board_num, String id) {
		System.out.println("isArticleWriter - svc");
		// 글 수정 작업 전 작성자 확인을 위한 패스워드 비교
				boolean isArticleWriter = false;
				
				// 1(공통). Connection 객체 가져오기
				Connection con = getConnection();
				
				// 2(공통). BoardDAO 객체 가져오기
				FreeBoardDAO freeBoardDAO = FreeBoardDAO.getInstance();
				
				// 3(공통). BoardDAO 객체에 Connection 객체 전달
				freeBoardDAO.setConnection(con);
				
				isArticleWriter = freeBoardDAO.isArticleFreeBoardWriter(board_num, id);
		
				// 5(공통). Connection 객체 반환하기
				close(con);
				
				// 6. 결과 리턴
				return isArticleWriter;
		
		
	}

	public static boolean modifyArticle(FreeBoardBean article) {
		System.out.println("modifyArticle - svc");
boolean isModifySuccess = true;
		
		// 1(공통). Connection 객체 가져오기
		Connection con = getConnection();
		
		// 2(공통). BoardDAO 객체 가져오기
		FreeBoardDAO freeBoardDAO = FreeBoardDAO.getInstance();
		
		// 3(공통). BoardDAO 객체에 Connection 객체 전달
		freeBoardDAO.setConnection(con);
		
		// 4. BoardDAO 클래스의 updateArticle() 메서드를 호출하여 글 수정
		//    => 파라미터 : BoardBean, 리턴타입 : int(updateCount)
		int updateCount = freeBoardDAO.updateArticle(article);
		
		// 5. 글 수정 결과에 대한 판별 작업 수행
		// => updateCount 가 0보다 크면 commit 수행, isModifySuccess 를 true 변경
		// => 아니면 rollback 수행
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		// 6(공통). Connection 객체 반환하기
		close(con);
		
		// 7. 결과 리턴
		return isModifySuccess;
	}
	
	
	
}