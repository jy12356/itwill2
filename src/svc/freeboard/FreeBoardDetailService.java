package svc.freeboard;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.FreeBoardDAO;
import vo.FreeBoardBean;

public class FreeBoardDetailService {

	// 게시물 1개에 대한 상세 내용을 요청하는 getArticle() 메서드 정의
	public FreeBoardBean getArticle(int board_num) throws Exception {
		System.out.println("BoardDetailService - getArticle()");
		
		// 1(공통). Connection 객체 가져오기
		Connection con = getConnection();
		
		// 2(공통). BoardDAO 객체 가져오기
		FreeBoardDAO freeBoardDAO = FreeBoardDAO.getInstance();
		
		// 3(공통). BoardDAO 객체에 Connection 객체 전달
		freeBoardDAO.setConnection(con);
		
		// 4. BoardDAO 객체의 selectArticle() 메서드를 호출하여
		//    게시물 1개 상세내용 조회 결과를 BoardBean 객체로 리턴받기
		//    => 파라미터 : 글번호(board_num), 리턴타입 : BoardBean
		FreeBoardBean article = freeBoardDAO.selectArticle(board_num);
		
		// 임시 확인용 BoardBean 객체 내용 출력
		System.out.println("글 제목 : " + article.getBoard_subject());
		
		// 게시물 상세 내용 조회가 성공했을 경우 
		// BoardDAO 객체의 updateReadCount() 메서드 호출하여
		// 해당 게시물 조회수(readcount)를 1만큼 증가시키기
		// => 파라미터 : 글번호(board_num), 
		//    리턴타입 : int(UPDATE 실행 결과(updateCount))
		if(article != null) { // 게시물 상세 내용이 리턴되었을 경우(= 조회 성공)
			int updateCount = freeBoardDAO.updateReadcount(board_num);
			
			// 조회수 증가가 성공했을 경우 commit, 실패했을 경우 rollback 수행
			if(updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		// 5(공통). Connection 객체 반환하기
		close(con);
		
		return article;
	}

}


















