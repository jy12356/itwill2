package svc.rental;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.RentalDAO;

public class RentalInsertService {

	public boolean insertRental(List<Integer> rentalAddList, String id) {
		System.out.println("RentalInsertService - insertRental()");
		boolean isInsertSuccess = false; 
		Connection con = getConnection();
		
		RentalDAO rentalDAO = RentalDAO.getInstance();
		System.out.println("insertRental 서비스");
		int insertCount = rentalDAO.insertRental(rentalAddList,id);
		System.out.println("렌탈 insert넣기 성공!");
		
		
		
		if(insertCount > 0) {
			commit(con); // DB 커밋 작업 수행
			isInsertSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
		} else {
			rollback(con);
		}
		close(con);
		return isInsertSuccess;
	}

}
