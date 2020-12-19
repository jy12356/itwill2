package svc.rental;

import java.sql.Connection;
import java.util.List;

import dao.RentalDAO;

import static db.JdbcUtil.*;

public class RentalInsertService {

	public boolean insertRental(List<Integer> rentalAddList, String id) {
		System.out.println("RentalInsertService - insertRental()");
		boolean isInsertSuccess = false; 
		Connection con = getConnection();
		RentalDAO rentalDAO = RentalDAO.getInstance();
		System.out.println("insertRental 서비스");
		rentalDAO.setConnection(con);
		int insertCount = rentalDAO.insertRental(rentalAddList,id);
		
		if(insertCount > 0) {
			System.out.println("렌탈 insert넣기 성공!");
			isInsertSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
			commit(con); // DB 커밋 작업 수행
		} else {
			rollback(con);
		}
		close(con);
		return isInsertSuccess;
	}

}
