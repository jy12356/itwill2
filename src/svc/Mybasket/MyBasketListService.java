package svc.Mybasket;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MyBasketDAO;
import vo.BookBean;
import vo.BookInterestBean;

public class MyBasketListService {

	public int getListCount(String id) throws Exception {
		System.out.println("MyBasketListService - getListCount()");
		int listCount = 0;

		Connection con = getConnection();

		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();

		myBasketDAO.setConnection(con);
		
		listCount = myBasketDAO.selectListCount(id);
		
//		System.out.println("가져온 listCount : " + listCount);
		close(con);
		

		return listCount;
	}

	public ArrayList<BookBean> getBasketList(int page, int limit, String id) {
		System.out.println("MyBasketListService - getBasketList");
		
		ArrayList<BookBean> basketList = new ArrayList<BookBean>();
		
		Connection con = getConnection();
		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();
		myBasketDAO.setConnection(con);
		System.out.println("123");
		basketList = myBasketDAO.selectBasketList(page, limit, id);
		System.out.println("456");
		close(con);
		
		return basketList;
		
		
	}

	public String getMemState(String id) {
		System.out.println("MyBasketListService - getMemState()");
		
		String state = "";
		
		Connection con = getConnection();
		
		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();
		myBasketDAO.setConnection(con);
		
		state = myBasketDAO.stateMem(id);
		
		
		return state;
	}

}
