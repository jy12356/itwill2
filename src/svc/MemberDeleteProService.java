package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberDeleteProService {
	
	public boolean isArticleWriter(String id) throws Exception {
		
		boolean isArticleWriter = false;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		isArticleWriter = memberDAO.isIdCheck(id);
		
		close(con);
		
		return isArticleWriter;
	}

	public boolean delelteArticle(MemberBean article) {
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int deleteCount = memberDAO.deleteArticle(article);
		System.out.println("modifyArticle delelteArticle deleteCount : "+deleteCount);
		if(deleteCount>0) {
			isDeleteSuccess = true;
			System.out.println();
			commit(con); 
		} else {
			rollback(con);
		}
		
		close(con);
		return isDeleteSuccess;
	}
	
}

