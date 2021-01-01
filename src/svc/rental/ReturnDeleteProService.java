package svc.rental;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.RentalDAO;

public class ReturnDeleteProService {

	public boolean removeArticle(int num) {
		System.out.println("ReturnDeleteProService");
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		RentalDAO rentalDAO = RentalDAO.getInstance();
		rentalDAO.setConnection(con);
		
		int deleteCount = rentalDAO.deleteArticle(num);
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
