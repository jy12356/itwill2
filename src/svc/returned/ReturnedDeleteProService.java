package svc.returned;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.List;

import dao.ReturnedDAO;

public class ReturnedDeleteProService {

	public boolean removeArticle(List<Integer> inerNumList, String id) {
		System.out.println("ReturnedDeleteProService");
		boolean isDeleteOk = false;
		
		int isDeleteOkCount = 0;
		
		Connection con = getConnection();
		ReturnedDAO returnedDAO = ReturnedDAO.getInstance();
		returnedDAO.setConnection(con);
		
		isDeleteOkCount = returnedDAO.rentalDelete(inerNumList,id);
		
		if(isDeleteOkCount > 0) {
			
			isDeleteOk = true;
			commit(con);
			
		}else {
			rollback(con);
		}
		close(con);
		return isDeleteOk;
	}

}
