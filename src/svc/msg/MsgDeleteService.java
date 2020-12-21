package svc.msg;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.List;

import dao.MsgDAO;
import dao.QnaDAO;

public class MsgDeleteService {

	public boolean msgDelete(List<Integer> msgNumList, String id) {
		System.out.println("MsgDeleteService - msgDelete");
		
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		MsgDAO msgDAO = MsgDAO.getInstance();
		msgDAO.setConnection(con);
		
		int deleteCount = msgDAO.deleteMsg(msgNumList,id);
		System.out.println("deleteCount - " + deleteCount);
		if(deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;

	}
	
}
