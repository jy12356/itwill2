package svc.returned;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.ReturnedDAO;
import vo.ReturnedBean;

public class ReturnedInsertService {

	public boolean registArticle(ReturnedBean returnedBean) {
		System.out.println("ReturnedInsertService-registArticle()!");
		
		boolean isWriteSuccess = false; //글 등록 성공 여부를 저장
		Connection con = getConnection();
		ReturnedDAO returnedDAO = ReturnedDAO.getInstance();
		returnedDAO.setConnection(con);
		
		int insertCount = returnedDAO.insertArticle(returnedBean);
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
	}

}
