package svc.rental;
import static db.JdbcUtil.*;


import java.sql.Connection;
import java.util.ArrayList;

import dao.RentalDAO;
import dao.ReservationDAO;
import vo.RentalBean;
import vo.ReservationBean;

public class ReservationListService {

	public int getListCount(String id) {
		
		System.out.println("ReservationListService - getListCount()");
		
		int listCount = 0;

		Connection con = getConnection();

		ReservationDAO reservationDAO = ReservationDAO.getInstance();

		reservationDAO.setConnection(con);
		
		listCount = reservationDAO.selectListCount(id);
		
		close(con);
		

		return listCount;
	}

	public ArrayList<ReservationBean> getReservationList(int page, int limit, String id) {
		
		System.out.println("ReservationListService - getReservationList");
		
		ArrayList<ReservationBean> reservationList = new ArrayList<ReservationBean>();
		
		Connection con = getConnection();
		
		ReservationDAO reservationDAO = ReservationDAO.getInstance();
		reservationDAO.setConnection(con);
		
		System.out.println("getReservationList 1 - svc");
		reservationList = reservationDAO.selectReservationList(page, limit, id);
		System.out.println("getReservationList 2 - svc");
		close(con);
		
		return reservationList;
	}

	
	
	
	
}
