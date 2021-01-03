package svc;

import java.util.ArrayList;
import java.util.List;

import dao.BookDAO;
import dao.MemberDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;

import java.sql.Connection;

public class MemListDeleteService {
	public boolean dibsDelete(List<Integer> inerNumList, String id) {
		System.out.println("BookDibsDeleteService - dibsDelete");
		boolean isDelete = false;
		int isDeleteCount = 0;
		Connection con =  getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		isDeleteCount = memberDAO.dibsDelete(inerNumList,id);
		if(isDeleteCount > 0) {
			isDelete = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return isDelete;
	}
}
