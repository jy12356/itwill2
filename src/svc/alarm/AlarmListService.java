package svc.alarm;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.AlarmDAO;
import vo.AlarmBean;

public class AlarmListService {

	public int getListCount() throws Exception {
		int listCount = 0;

		Connection con = getConnection();

		AlarmDAO alarmDAO = AlarmDAO.getInstance();

		alarmDAO.setConnection(con);

		listCount = alarmDAO.selectListCount();

		close(con);

		return listCount;
		
	}
	
	public ArrayList<AlarmBean> getArticleList(int page, int limit) throws Exception {
		
		ArrayList<AlarmBean> articleList = null;

		Connection con = getConnection();

		AlarmDAO alarmDAO = AlarmDAO.getInstance();

		alarmDAO.setConnection(con);

		articleList = alarmDAO.selectArticleList(page, limit);

		close(con);

		return articleList;
	}
}
