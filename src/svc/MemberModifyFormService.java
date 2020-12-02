package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import javax.security.auth.login.LoginException;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberModifyFormService {

	public MemberBean getArticle(String id) throws Exception {
		System.out.println("MemberModifyFormService - getArticle()");
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		MemberBean article = memberDAO.selectMember(id);
		System.out.println(id);
		close(con);
		
		return article;
	}

}
