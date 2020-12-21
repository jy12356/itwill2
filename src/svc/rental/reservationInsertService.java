package svc.rental;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.RentalDAO;

public class reservationInsertService {

	public boolean insertReservation(List<Integer> reservationAddList, String id) {
		System.out.println("reservationInsertService - insertReservation()");
		boolean isInsertSuccess = false;

		Connection con = getConnection();

		RentalDAO rentalDAO = RentalDAO.getInstance();

		System.out.println("insertReservation 서비스");

		rentalDAO.setConnection(con);

		int insertCount = rentalDAO.insertReservation(reservationAddList, id);

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

}
