package svc.book;

import vo.BookBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BookDAO;
public class BookWriteService {

	public boolean insertBook(BookBean bookBean)throws Exception {
		System.out.println("BookWriteService - insertBook()");
		boolean isWriteSuccess = false; // 글 등록 성공 여부를 저장
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		int insertCount = bookDAO.insertBook(bookBean);
		if(insertCount > 0) {
			commit(con); // DB 커밋 작업 수행
			isWriteSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
		} else {
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
	}

	public boolean selectIsbn(String isbn) {
		boolean isIsbn = false;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		isIsbn = bookDAO.selectIsbn(isbn);
		if(isIsbn) {
			commit(con); // DB 커밋 작업 수행
			isIsbn = true; // 리턴할 작업 수행 결과를 true 로 설정
		} else {
			rollback(con);
		}
		close(con);
		return isIsbn;
	}

}
