package svc;

import static db.JdbcUtil.close;
import org.json.simple.*;
import java.sql.Connection;

import javax.security.auth.login.LoginException;

import dao.MemberDAO;
import db.JdbcUtil;

public class MemberCheckService {
	public boolean registArticle(String id) throws LoginException {
		System.out.println("MemberCheckService - registArticle()");
		
		boolean isIdCheckSuccess = false; 
		Connection con = JdbcUtil.getConnection();
		System.out.println("MemberCheckService¿« id11 : "+id);
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		isIdCheckSuccess = memberDAO.isIdCheck(id);
		System.out.println("MemberCheckService¿« isIdCheckSuccess22 : "+isIdCheckSuccess);

		close(con);

		return isIdCheckSuccess;
	}
}
