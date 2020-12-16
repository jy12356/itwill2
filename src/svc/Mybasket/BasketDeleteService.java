package svc.Mybasket;

import java.sql.Connection;
import java.util.List;
import static db.JdbcUtil.*;

import dao.MyBasketDAO;

public class BasketDeleteService {

	public boolean basketDelete(List<Integer> inerNumList, String id) {
		System.out.println("basketDeleteDeleteService - svc");
		
		boolean isDeleteOk = false;
		
		int isDeleteOkCount = 0;
		
		Connection con =  getConnection();
		MyBasketDAO myBasketDAO = MyBasketDAO.getInstance();
		myBasketDAO.setConnection(con);
		isDeleteOkCount = myBasketDAO.basketDelete(inerNumList,id);
		if(isDeleteOkCount > 0) {
			isDeleteOk = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return isDeleteOk;
	}

}
