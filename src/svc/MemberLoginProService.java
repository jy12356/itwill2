package svc;

import java.sql.Connection;

import javax.security.auth.login.LoginException;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

import java.sql.Connection;

import dao.MemberDAO;
import static db.JdbcUtil.*;
import vo.MemberBean;

public class MemberLoginProService {
	
	public boolean registArticle(String id,String password) throws LoginException {
		System.out.println("MemberLoginProService - registArticle()");
		
		boolean isLoginSuccess = false; 
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		isLoginSuccess = memberDAO.isMember(id, password);
		
		close(con);

		return isLoginSuccess;
	}
	
}
