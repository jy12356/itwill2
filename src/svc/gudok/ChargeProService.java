package svc.gudok;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.GudokDAO;
import vo.GudokBean;

public class ChargeProService {

	public static boolean registArticle(GudokBean gudokBean) {
		System.out.println("ChargeProService-registArticle()!");
		
		boolean isWriteSuccess = false; //글 등록 성공 여부를 저장
		
		Connection con = getConnection();
		GudokDAO gudokDAO = GudokDAO.getInstance();
		gudokDAO.setConnection(con);
		
		int insertCount = gudokDAO.insertArticle(gudokBean);
		
		if(insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		}else {
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
	}

}
