package svc.rental;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.ReservationDAO;

public class ReservationDeleteService {

	public boolean renservationDelete(List<Integer> inerNumList, String id) {
		
		System.out.println("ReservationDeleteService - renservationDelete");
		boolean isDeleteOk = false;
		
		int isDeleteOkCount = 0;
		
		Connection con =  getConnection();
		
		ReservationDAO reservationDAO = ReservationDAO.getInstance();
		
		reservationDAO.setConnection(con);
		
		isDeleteOkCount = reservationDAO.reservationDelete(inerNumList,id);
		
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
