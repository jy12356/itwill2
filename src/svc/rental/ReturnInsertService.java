package svc.rental;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.RentalDAO;
import vo.RentalBean;

public class ReturnInsertService {

	public boolean registArticle(RentalBean article) {
System.out.println("ReturnInsertService-registArticle!");
		boolean isModifySuccess = true;
		Connection con = getConnection();
		RentalDAO rentalDAO = RentalDAO.getInstance();
		rentalDAO.setConnection(con);
		
		int updateCount = rentalDAO.updateArticle(article);
		
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
