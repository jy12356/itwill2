package svc.qna;

import java.sql.Connection;

import dao.QnaDAO;
import vo.QnaBean;

import static db.JdbcUtil.*;

public class QnaModifyProService {

	public boolean modifyArticle (QnaBean article) {
		boolean isModifySuccess = true;
		
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		int updateCount = qnaDAO.updateArticle(article);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
		
	}
}
