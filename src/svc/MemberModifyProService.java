package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberModifyProService {

	public boolean isArticleWriter(String id, String password) throws Exception {
		boolean isArticleWriter = false;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
//<<<<<<< HEAD
		isArticleWriter = memberDAO.isMember(id, password);
//=======
//		isArticleRequestWriter = memberDAO.isArticleMemberWriter(id, password);
//>>>>>>> refs/heads/master
		
		close(con);
		
		return isArticleWriter;
	}

	public boolean modifyArticle(MemberBean article) {
		boolean isModifySuccess = true;
		
		Connection con = getConnection();
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.setConnection(con);
		
		int updateCount = memberDAO.updateArticle(article);
		
		if(updateCount>0) {
			commit(con); 
		} else {
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
	}
	
}
















