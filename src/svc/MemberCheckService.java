package svc;

import static db.JdbcUtil.close;

import java.sql.Connection;

import javax.security.auth.login.LoginException;

import dao.MemberDAO;
import db.JdbcUtil;

public class MemberCheckService {
	public boolean registArticle(String id) throws LoginException {
		System.out.println("MemberCheckService - registArticle()");
		
		boolean isIdCheckSuccess = false; 
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		System.out.println("MemberCheckService¿« id : "+id);
		isIdCheckSuccess = memberDAO.isIdCheck(id);
		
		close(con);

		return isIdCheckSuccess;
	}
}
