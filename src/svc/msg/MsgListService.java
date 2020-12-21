package svc.msg;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.MsgDAO;
import vo.MsgBean;
public class MsgListService {

	public int myMsgListCount(String id) {
		
		System.out.println("MsgListService - myMsgListCount");
		Connection con = getConnection();
		MsgDAO msgDAO = MsgDAO.getInstance();
		msgDAO.setConnection(con);
		int listcount = msgDAO.myMsgListCount(id);
		close(con);
		return listcount;
	}

	public ArrayList<MsgBean> myMsgList(int page, int limit, String id) {
		ArrayList<MsgBean> myMsgList = new ArrayList<MsgBean>();
		MsgDAO msgDAO = MsgDAO.getInstance();
		Connection con = getConnection();
		msgDAO.setConnection(con);
		myMsgList = msgDAO.myMsgList(page,limit,id);
		close(con);
		return myMsgList;
	}

}
