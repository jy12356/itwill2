package svc.Mybasket;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BookDAO;
import dao.MyBasketDAO;

public class MyBasketInsertService {

	public boolean insertBasket(String isbn, String id) {
		System.out.println("MyBasketInsertService - insertBasket()");
		boolean isInsertSuccess = false; // 글 등록 성공 여부를 저장
		Connection con = getConnection();

		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();
		myBasketDAO.setConnection(con);

		int insertCount = myBasketDAO.insertBasket(isbn, id);

		if (insertCount > 0) {
			commit(con); // DB 커밋 작업 수행
			isInsertSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
		} else {
			rollback(con);
		}
		close(con);
		return isInsertSuccess;
	}

	public boolean checkOverlap(String isbn, String id) {
		System.out.println("MyBasketInsertService - checkOverlap()");
		boolean isOverlap = false; 
		
		Connection con = getConnection();
		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();
		myBasketDAO.setConnection(con);
		int count = myBasketDAO.overlap(isbn, id);
		
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
