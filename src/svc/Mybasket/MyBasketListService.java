package svc.Mybasket;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MyBasketDAO;
import vo.BookBean;
import vo.BookInterestBean;
import vo.MyBasketBean;

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

	public ArrayList<MyBasketBean> getRentalableList(int page, int limit, String id) {
		System.out.println("MyBasketListService - getRentalableList");
		
		ArrayList<MyBasketBean> basketList = new ArrayList<MyBasketBean>();
		
		Connection con = getConnection();
		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();
		myBasketDAO.setConnection(con);
		System.out.println("getRentalableList 1 - svc");
		basketList = myBasketDAO.selectRentalableList(page, limit, id);
		System.out.println("getRentalableList 2 - svc");
		close(con);
		
		return basketList;
		
		
	}
	public ArrayList<MyBasketBean> getUnRentalableList(int page, int limit, String id) {
		System.out.println("MyBasketListService - getUnRentalableList");
		
		ArrayList<MyBasketBean> basketList = new ArrayList<MyBasketBean>();
		
		Connection con = getConnection();
		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();
		myBasketDAO.setConnection(con);
		System.out.println("getUnRentalableList 1 - svc");
		basketList = myBasketDAO.selectUnRentalableList(page, limit, id);
		System.out.println("getUnRentalableList 2 - svc");
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
