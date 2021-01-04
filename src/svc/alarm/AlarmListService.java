package svc.alarm;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.AlarmDAO;
import vo.AlarmBean;

public class AlarmListService {

	public int listCount(String id) {
		int listCount = 0;

		Connection con = getConnection();

		AlarmDAO alarmDAO = AlarmDAO.getInstance();

		alarmDAO.setConnection(con);

		listCount = alarmDAO.selectListCount(id);

		close(con);

		return listCount;
	}
}
