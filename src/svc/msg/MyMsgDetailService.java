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

}