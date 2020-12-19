package svc.rental;
import static db.JdbcUtil.*;


import java.sql.Connection;
import java.util.ArrayList;

import dao.MyBasketDAO;
import dao.RentalDAO;
import vo.MyBasketBean;
import vo.RentalBean;

public class rentalListService {

	public int getListCount(String id) {
		System.out.println("rentalListService - getListCount()");
		
		int listCount = 0;

		Connection con = getConnection();

		RentalDAO rentalDAO = RentalDAO.getInstance();

		rentalDAO.setConnection(con);
		
		listCount = rentalDAO.selectListCount(id);
		
		close(con);
		

		return listCount;
	}

	public ArrayList<RentalBean> getRentalList(int page, int limit, String id) {
		System.out.println("rentalListService - getRentalList");
		
		ArrayList<RentalBean> rentalList = new ArrayList<RentalBean>();
		
		Connection con = getConnection();
		
		RentalDAO rentalDAO = RentalDAO.getInstance();
		rentalDAO.setConnection(con);
		
		System.out.println("getRentalList 1 - svc");
		rentalList = rentalDAO.selectRentalList(page, limit, id);
		System.out.println("getRentalList 2 - svc");
		close(con);
		
		return rentalList;
	}

}


























