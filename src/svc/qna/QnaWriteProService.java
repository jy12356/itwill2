package svc.qna;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.QnaDAO;
import vo.QnaBean;
import static db.JdbcUtil.*;

public class QnaWriteProService {
	public boolean registArticle(QnaBean qnaBean){
		System.out.println("QnaWriteProService - registArticle()!!");
		
		boolean isWriteSuccess = false; //글 등록 성공 여부를 저장
		
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		int insertCount = qnaDAO.insertArticle(qnaBean);
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		
		return isWriteSuccess;
		
	}
}
