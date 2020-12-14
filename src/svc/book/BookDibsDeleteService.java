package svc.book;

import java.sql.Connection;
import java.util.List;

import dao.BookDAO;
import vo.BookBean;

import static db.JdbcUtil.*;

public class BookDibsDeleteService {

	public boolean dibsDelete(List<Integer> inerNumList, String id) {
		System.out.println("BookDibsDeleteService - dibsDelete");
		boolean isDeleteOk = false;
		int isDeleteOkCount = 0;
		Connection con =  getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		isDeleteOkCount = bookDAO.dibsDelete(inerNumList,id);
		if(isDeleteOkCount > 0) {
			isDeleteOk = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return isDeleteOk;
	}
//	public boolean dibsYn(String id, int num) {
//		System.out.println("BookDibsDeleteService - dibsYn");
//		boolean isdibsYn = false;
//		int isBookExisCount = 0;
//		Connection con =  getConnection();
//		BookDAO bookDAO = BookDAO.getInstance();
//		bookDAO.setConnection(con);
//		
//		isBookExisCount = bookDAO.dibsYn(id,num);
//		if(isBookExisCount > 0) {
//			isdibsYn = true;
//			commit(con);
//		}else {
//			rollback(con);
//		}
//		close(con);
//		return isdibsYn;
//	}
}
