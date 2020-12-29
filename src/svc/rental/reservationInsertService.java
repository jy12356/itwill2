package svc.rental;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.RentalDAO;
import dao.ReservationDAO;

public class reservationInsertService {

	public boolean insertReservation(List<Integer> reservationAddList, String id) {
		System.out.println("reservationInsertService - insertReservation()");
		boolean isInsertSuccess = false;

		Connection con = getConnection();

		ReservationDAO reservationDAO = ReservationDAO.getInstance();

		System.out.println("insertReservation 서비스");

		reservationDAO.setConnection(con);

		int insertCount = reservationDAO.insertReservation(reservationAddList, id);

		if (insertCount > 0) {
			System.out.println("예약 insert작업 성공!");
			isInsertSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
			commit(con); // DB 커밋 작업 수행
		} else {
			rollback(con);
		}
		close(con);
		return isInsertSuccess;
	}

	public boolean checkOverlap(List<Integer> reservationAddList, String id) {
		System.out.println("reservationInsertService - checkOverlap()");
		boolean isOverlap = false; 
		
		Connection con = getConnection();
		ReservationDAO reservationDAO = ReservationDAO.getInstance();
		reservationDAO.setConnection(con);
		
		int count = reservationDAO.overlap(reservationAddList, id);
		
		if (count > 0) {
			commit(con);
			isOverlap = true; 
		} else {
			rollback(con);
		}
		close(con);
		
		
		
		
		return isOverlap;
	}

}














