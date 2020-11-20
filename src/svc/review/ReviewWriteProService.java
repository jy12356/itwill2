package svc.review;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

import static db.JdbcUtil.*;

public class ReviewWriteProService {

	// 글 쓰기(등록) : 요청을 처리하기 위한 registArticle() 메서등 정의
	public boolean registArticle(ReviewBean reviewBean) {
		System.out.println("ReviewWriteProService - registArticle");
		
		boolean isWriteSuccess = false;
		
		// DB 작업을 위한 비지니스 로직 수행 준비
		// 1. (공통 ) DB 작업에 필요한 Connection 객체 가져오기
		Connection con = getConnection();
		// 2. (공통 ) DB 작업에 필요한 DAO 객체 가져오기
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		// 3. (공통 ) 가져온 Connection 객체를 DAO 객체에 전달하기
		reviewDAO.setConnection(con);
		// 4. ReviewDAO 객체의 insertArticle() 메서드를 호출하여 글 등록 처리
		int insertCount = reviewDAO.insertArticle(reviewBean);
		// 5. 리턴받은 글 등록 결과를 판별
		if(insertCount>0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}
		// 6. (공통) 사용이 완료된 Connection 객체 반환하기
		close(con);
		// 7. 글 등록 성공 여부 리턴 => BoardWriteProAction 클래스로 전달
		return isWriteSuccess;
	}
}
