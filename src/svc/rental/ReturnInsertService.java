package svc.rental;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.RentalDAO;
import vo.RentalBean;

public class ReturnInsertService {

	public boolean registArticle(RentalBean rentalBean) {
System.out.println("ReturnInsertService-registArticle!");
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		RentalDAO rentalDAO = RentalDAO.getInstance();
		rentalDAO.setConnection(con);
		
		int insertCount = rentalDAO.insertArticle(rentalBean);
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
