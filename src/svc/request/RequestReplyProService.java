package svc.request;

import java.sql.Connection;

import static db.JdbcUtil.*;

import dao.RequestDAO;
import vo.RequestBean;

public class RequestReplyProService {

	public static boolean replyArticle(RequestBean article) {
		
		boolean isReplySuccess = false;

		Connection con = getConnection();

		RequestDAO requestDAO = RequestDAO.getInstance();

		requestDAO.setConnection(con);

		int insertCount = requestDAO.insertReplyArticle(article);

		if (insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		} else {
			rollback(con);
		}

		close(con);

		return isReplySuccess;
	}

}
