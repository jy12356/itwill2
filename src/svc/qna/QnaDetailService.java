package svc.qna;

import java.sql.Connection;

import dao.QnaDAO;
import vo.QnaBean;
import static db.JdbcUtil.*;

public class QnaDetailService {

	public QnaBean getArticle(int board_num) throws Exception {
		System.out.println("QnaDetailService");
		
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		QnaBean article = qnaDAO.selectArticle(board_num);
		close(con);
		return article; 
	}
}
