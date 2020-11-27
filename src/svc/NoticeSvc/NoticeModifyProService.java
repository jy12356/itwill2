package svc.NoticeSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;
import vo.NoticeBean;

public class NoticeModifyProService {
	public boolean isArticleWriter(int num, String id) throws Exception{
		// 글 수정 작업 전 작성자 확인을 위한 패스워드 비교
				boolean isArticleWriter = false;
				
				// 1(공통). Connection 객체 가져오기
				Connection con = getConnection();
				
				// 2(공통). BoardDAO 객체 가져오기
				NoticeDAO noticeDAO = NoticeDAO.getInstance();
				
				// 3(공통). BoardDAO 객체에 Connection 객체 전달
				noticeDAO.setConnection(con);
				
				// 4. BoardDAO 클래스의 isArticleBoardWriter() 메서드를 호출하여
				//    적합한 사용자인지 판별
				//    => 파라미터 : 글번호, 패스워드, 리턴타입 : boolean(isArticleWriter)
				isArticleWriter = noticeDAO.isArticleNoticeWriter(num, id);
				
				// 5(공통). Connection 객체 반환하기
				close(con);
				
				// 6. 결과 리턴
				return isArticleWriter;
			}

			public boolean modifyArticle(NoticeBean article) {
				//BoardBean객체에 저장된 내용을 사용하여 글 수정 수행
				boolean isModifySuccess = true;
				
				// 1(공통). Connection 객체 가져오기
						Connection con = getConnection();
						
						// 2(공통). BoardDAO 객체 가져오기
						NoticeDAO noticeDAO = NoticeDAO.getInstance();
						
						// 3(공통). BoardDAO 객체에 Connection 객체 전달
						noticeDAO.setConnection(con);
						
						// 4. BoardDAO 클래스의 updateArticle()메서드를 호출하여 글 수정
						//=>파라미터 : BoardBean, 리턴타입 : 	int(updateCount)
						int updateCount = noticeDAO.updateArticle(article);
						
						//5. 글 수정 결과에 대한 판별 작업 수행
						//=>updateCount가 0보다 크면 commit 수행, isModifySuccess를 true로 변경
						//=>아니면 rollback()수행
						if(updateCount >0) {
							commit(con);
							isModifySuccess = true;
						}else {
							
						}rollback(con);
							// 6(공통). Connection 객체 반환하기
						close(con);
						
						// 7. 결과 리턴
				return isModifySuccess;

	}
}
