package svc.rental;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.RentalDAO;

public class RentalDeleteService {

	public boolean rentalDelete(List<Integer> inerNumList, String id) {
		System.out.println("RentalDeleteService - rentalDelete");
		boolean isDeleteOk = false;
		
		int isDeleteOkCount = 0;
		
		Connection con =  getConnection();
		
		RentalDAO rentalDAO = RentalDAO.getInstance();
		
		rentalDAO.setConnection(con);
		
		isDeleteOkCount = rentalDAO.rentalDelete(inerNumList,id);
		
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























