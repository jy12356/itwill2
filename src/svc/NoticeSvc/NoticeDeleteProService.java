package svc.NoticeSvc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;

public class NoticeDeleteProService {
		
	public boolean isArticleNoticeWriter(int num, String id) {
		boolean isArticleNoticeWriter = false;
		
		// 1. Connection
		Connection con = getConnection();
		
		// 2. BoardDAO
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		
		// 3.BoardDAO에 Connection객체 전달
		noticeDAO.setConnection(con);
		
		// 4. BoardDAO에 num, id 비교
		isArticleNoticeWriter = noticeDAO.isArticleNoticeWriter(num, id);
		
		// 5. Connection 객체 반환
		close(con);
		
		
		return isArticleNoticeWriter;
	}
	
	public boolean removeArticle(int num) {

		boolean isDeleteSuccess = true;

		Connection con = getConnection();

		NoticeDAO noticeDAO = NoticeDAO.getInstance();

		noticeDAO.setConnection(con);

		int deleteCount = noticeDAO.deleteArticle(num);

		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);

		return isDeleteSuccess;
	}

}