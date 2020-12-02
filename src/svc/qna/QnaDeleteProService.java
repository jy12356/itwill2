package svc.qna;

import java.sql.Connection;
import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;
import dao.QnaDAO;

public class QnaDeleteProService {

	public boolean removeArticle(int board_num) {
		System.out.println("QnaDeleteProService");
		
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		int deleteCount = qnaDAO.deleteArticle(board_num);
		System.out.println("deleteCount - " + deleteCount);
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
