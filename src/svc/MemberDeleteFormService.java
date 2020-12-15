package svc;

import static db.JdbcUtil.close;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberBean;

public class MemberDeleteFormService {

	public MemberBean getArticle(String id) throws Exception {
		System.out.println("MemberDeleteFormService - getArticle()");
		
		Connection con = JdbcUtil.getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		MemberBean article = memberDAO.selectMember(id);
		System.out.println(id);
		close(con);
		
		return article;
	}
}
