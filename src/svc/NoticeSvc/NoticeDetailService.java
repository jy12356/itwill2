package svc.NoticeSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO.NoticeDAO;
import vo.NoticeVo.NoticeBean;
public class NoticeDetailService {
	public NoticeBean getArticle (int num) throws Exception{
		System.out.println("NoticeDetailService - getArticle");
		
		//1(공통) Connection객체 가져오기
		Connection con = getConnection();
		//2(공통) BoardDAO 객체 가져오기
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		//3(공통) BoardDAO 객체에 Connection 전달
		noticeDAO.setConnection(con);
		//4 BoardDAO객체의 selectarticle() 메서드를 호출하여
		//	  게시물 1개 상세내용 조회 결과를 BoardBean 객체로 리턴받기
		//	   파라미터 : 글번호(board_num), 리턴타입 : BoardBean
		NoticeBean article = noticeDAO.selectArticle(num);
		
		//게시물 상세 내용 조회가 성공했을 경우
		//BoardDAO 객체의 updateReadCount() 메서드 호출하여
		//해당 게시물 조회수(readCount) 1 증가 시키기
		//=>파라미터 : 글번호(board_num), 리턴타입 : UPDATE 실행 결과(updateCount)
		if(article !=null) {//게시물 상세 내용이 리턴되었을 경우(=조회 성공)
			int updateCount = noticeDAO.updateReadcount(num);
			//조회수 증가가 성공했을 경우 commit, 실패했을 경우 rollback 실행
			if(updateCount > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		//5(공통) Connection 객체 반환하기
		close(con);
		//6 전체 게시물 수 리턴
		return article;
	}
}
