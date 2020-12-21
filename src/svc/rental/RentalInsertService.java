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
		
		// 인설트작업하기전에 rental table : 대여중인도서 count가 
		// 5개 이상일경우 insert작업 안되게.
		int checkCount = rentalDAO.selectListCount(id); 
		System.out.println("checkCount : " + checkCount);
		
		if (checkCount < 5) {

			int insertCount = rentalDAO.insertRental(rentalAddList, id);
			
			if (insertCount > 0) {
				System.out.println("렌탈 insert작업 성공!");
				isInsertSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
				commit(con); // DB 커밋 작업 수행
			} else {
				System.out.println("렌탈 insert작업 실패!");
				rollback(con);
			}
		
		
		} else {
			System.out.println("렌탈 count가 5개넘어서 실패!");
			rollback(con);
		}
		
		
		close(con);
		return isInsertSuccess;
	}

	public static boolean checkOverlap(List<Integer> rentalAddList, String id) {
		System.out.println("RentalInsertService - checkOverlap()");
		boolean isOverlap = false; 
		
		Connection con = getConnection();
		RentalDAO rentalDAO = RentalDAO.getInstance();
		rentalDAO.setConnection(con);
		
		int count = rentalDAO.overlap(rentalAddList, id);
		
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

























