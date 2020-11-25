package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberWriteProService {
	
	public boolean registArticle(MemberBean memberBean) {
		System.out.println("memberWriteProService - registArticle()");
		
		boolean isWriteSuccess = false; 
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int insertCount = memberDAO.insertArticle(memberBean);
		
		if(insertCount > 0) {
			JdbcUtil.commit(con); 
			isWriteSuccess = true; 
		} else {
			JdbcUtil.rollback(con);
		}
		
		JdbcUtil.close(con);

		return isWriteSuccess;
	}
	
}
