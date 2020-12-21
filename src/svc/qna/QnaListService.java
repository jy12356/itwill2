package svc.qna;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnaDAO;
import vo.QnaBean;

public class QnaListService {
	public int getListCount() throws Exception{
		int listCount = 0;
		
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		listCount = qnaDAO.selectListCount();
		close(con);
		
		return listCount;
	}

public ArrayList<QnaBean> getArticleList(int page, int limit, String search) throws Exception{
	ArrayList<QnaBean> articleList = null;
	
	Connection con = getConnection();
	QnaDAO qnaDAO = QnaDAO.getInstance();
	qnaDAO.setConnection(con);
	
	articleList = qnaDAO.selectArticleList(page, limit,search);
	
	close(con);
	
	return articleList;
}
	
	
	
}
