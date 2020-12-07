package svc.book;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookBean;

public class BookDibsInsertService {

	public boolean insertBookDibs(String isbn, String id) {
		System.out.println("BookDibsInsertService - insertBookDibs()");
		boolean isInsertSuccess = false; // 글 등록 성공 여부를 저장
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		int insertCount = bookDAO.insertBookDibs(isbn,id);
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
