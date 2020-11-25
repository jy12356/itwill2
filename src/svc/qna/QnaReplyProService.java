package svc.qna;

import java.sql.Connection;
import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import dao.QnaDAO;
import vo.QnaBean;

public class QnaReplyProService {

	public boolean replyArticle(QnaBean article) {
		boolean isReplySuccess = false;
		
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		System.out.println("QnaReplyProService = " + article.getTitle());
		System.out.println("QnaReplyProService = " + article.getContent2());
		
		int insertCount = qnaDAO.insertReplyArticle(article);
		if(insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		
		return isReplySuccess;
	}

}
