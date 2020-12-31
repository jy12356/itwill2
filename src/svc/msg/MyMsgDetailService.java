package svc.msg;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MsgDAO;
import vo.MsgBean;

public class MyMsgDetailService {


	public MsgBean getMsgDetail(int num, String id) {
		System.out.println("MyMsgDetailService-getMsgDetail");
		Connection con = getConnection();

		MsgDAO msgDAO = MsgDAO.getInstance();

		msgDAO.setConnection(con);

		MsgBean msgBean = msgDAO.getMyMsg(num, id);
		close(con);
		
		return msgBean;
	}

	public boolean updateIsRead(int num) {
		boolean isRead =false;
		System.out.println("MyMsgDetailService-updateIsRead");
		Connection con = getConnection();
		MsgDAO msgDAO = MsgDAO.getInstance();
		msgDAO.setConnection(con);
		int updateIsReadCount = msgDAO.updateStatus(num);
		if(updateIsReadCount >0) {
			commit(con);
			isRead = true;
		}else {
			rollback(con);
		}
		// 6(공통). Connection 객체 반환하기
		close(con);
		return isRead;
	}	

}