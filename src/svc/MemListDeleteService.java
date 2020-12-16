package svc;

import java.util.ArrayList;
import java.util.List;

import dao.MemberDAO;
import vo.MemberBean;

import static db.JdbcUtil.*;

import java.sql.Connection;

public class MemListDeleteService {
	public boolean dibsDelete(List<Integer> inerNumList, String id) {
		System.out.println("BookDibsDeleteService - dibsDelete");
		boolean isDeleteOk = false;
		int isDeleteOkCount = 0;
		Connection con =  getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		isDeleteOkCount = memberDAO.dibsDelete(inerNumList,id);
		if(isDeleteOkCount > 0) {
			isDeleteOk = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return isDeleteOk;
	}
}
