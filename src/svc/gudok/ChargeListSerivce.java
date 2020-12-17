package svc.gudok;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.GudokDAO;
import vo.GudokBean;


public class ChargeListSerivce {

	public int getListCount() throws Exception{
		int listCount = 0;
		Connection con = getConnection();
		GudokDAO gudokDAO = GudokDAO.getInstance();
		gudokDAO.setConnection(con);
		
		listCount = gudokDAO.selectListCount();
		close(con);
		
		return listCount;
	}

	public ArrayList<GudokBean> getArticleList(int page, int limit) throws Exception{
		ArrayList<GudokBean> articleList = null;
		
		Connection con = getConnection();
		GudokDAO gudokDAO = GudokDAO.getInstance();
		gudokDAO.setConnection(con);
		
		articleList = gudokDAO.selectArticleList(page, limit);
		
		close(con);
		return articleList;
	}

}
