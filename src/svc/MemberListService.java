package svc;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberListService {
	public int getListCount() throws Exception {
		
		System.out.println("MemberListService - getListCount");
		
		int listCount = 0;
		
		// 1(����). Connection ��ü ��������
		Connection con = getConnection();
		
		// 2(����). BoardDAO ��ü ��������
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 3(����). BoardDAO ��ü�� Connection ��ü ����
		memberDAO.setConnection(con);
		// 4. BoardDAO ��ü�� selectListCount() �޼��� ȣ���Ͽ�
		//    ��ü �Խù� �� ��������
		listCount = memberDAO.selectListCount();
		// 5(����). Connection ��ü ��ȯ�ϱ�
		close(con);
		// 6. ��ü �Խù� �� ����
		return listCount;
	
	}

	public static ArrayList<MemberBean> getArticleList(int page, int limit) {
		
		ArrayList<MemberBean> articleList = null;
		
		// 1(����). Connection ��ü ��������
		Connection con = getConnection();
		// 2(����). BoardDAO ��ü ��������
		MemberDAO memberDAO = MemberDAO.getInstance();
		// 3(����). BoardDAO ��ü�� Connection ��ü ����
		memberDAO.setConnection(con);
		// 4. BoardDAO ��ü�� selectAriticleList() �޼��带 ȣ���Ͽ�
		//    �Խù� ��� ��ȸ ����� ArrayList ��ü�� ���Ϲޱ�
		//    => �Ķ���� : page, limit
		articleList = memberDAO.selectArticleList(page,limit);
		// 5(����). Connection ��ü ��ȯ�ϱ�
		close(con);
		// 6. ��ü �Խù� �� ����
		return articleList;
		
	}
}
