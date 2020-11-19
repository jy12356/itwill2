package action;

import java.io.IOException;
import java.rmi.Remote;
import java.rmi.server.RemoteCall;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Dispatch;

import sun.rmi.server.Dispatcher;
import svc.MemberListService;
import vo.ActionForward;
import vo.FreeBoardBean;
import vo.MemberBean;
import vo.PageInfo;

public class MemberListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// BoardListService Ŭ������ ���� �Խù� ����� ��ȸ ��
		// ��ȸ ����� request ��ü�� �����ϰ�, qna_board_list.jsp �������� ������
		// => �� ��, request ��ü�� �����ϰ�, ���� �ּ��� ���� ����
		//    ������ �ؾ��ϹǷ� ������ ����� Dispatcher ������� ����
		System.out.println("BoardListAction");
		
		ActionForward forward = null;
		
		// ����¡ ó���� ���� ���� ����
		int page = 1; // ���� ������ ��ȣ ���� ����
		int limit = 10; // ������ �� ǥ���� �Խù� ���� �����ϴ� ����
		
		// request ��ü�κ��� "page" �Ķ���Ͱ� ���޵��� ��� (null�� �ƴ� ���)
		// �ش� �Ķ��� ���� page ������ ����(String -> int ��ȯ �ʿ�)
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// BoardListService Ŭ���� �ν��Ͻ� ���� ��
		// getListCount() �޼��带 ȣ���Ͽ� ��ü �Խù� �� (listCount) ��������
		MemberListService memberListService = new MemberListService();
		int listCount = memberListService.getListCount();
//		System.out.println("��ü �Խù� �� : "+ listCount);
		
		// ��ü �Խù� ����� ������ ArrayList ��ü(articleList) ����
		// => ���׸� Ÿ������ BoardBean Ÿ�� ����
		ArrayList<MemberBean> articleList = new ArrayList<MemberBean>();
		// BoardListService Ŭ������ getArticleList() �޼��带 ȣ���Ͽ�
		// ��ü �Խù� ��� ���� �޾� ArrayList ��ü�� ����
		// => �Ķ���� : ���� ��������ȣ(page), ������ �� �Խù� ��(limit)
		articleList = MemberListService.getArticleList(page, limit);
		
		// ������ ��� �۾� ����
		// 1. ��ü ������ �� ���
		//    (�� �Խù� �� / ������ �� �Խù� �� + 0.95) -> ������ ��ȯ
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		// 2. ���� ���������� ������ ���� ������ ��(1, 11, 21 ������ ��)
		int startPage = ((int)((double)page / 10 + 0.9 ) - 1) * 10 + 1;
		
		// 3. ���� ���������� ������ ������ ������ ��ȣ (10, 20, 30 ������ ��)
		int endPage = startPage + 10 - 1;
		
		// 4. ������ �������� ���� ���������� ǥ����
		//    �ִ� ������(��ü ������) �� ���� Ŭ ���
		//    ������ ������ ��ȣ�� ��ü ������ ��ȣ�� ��ü
		if(endPage > maxPage ) {
			endPage = maxPage;
		 }
		// ���� ��� ������ ������ PageInfo ��ü�� ����
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		// request ��ü�� attribute() �޼��带 ȣ���Ͽ�
		// �Խù� ��� ���� (ArrayList)�� ������ ����(PageInfo) ��ü�� ����
		request.setAttribute("articleList", articleList);
		request.setAttribute("pageInfo", pageInfo);
		
		// ActionForward ��ü�� �����Ͽ� qna_board_list.jsp �������� ������ ����
		// => request ��ü�� �����Ǿ�� �ϸ�, ���� �ּҰ� �����Ǿ�� �ϹǷ�
		//    Dispatcher ������� ������ ����
		forward = new ActionForward();
		forward.setPath("/board/qna_board_list.jsp");
//		forward.setRedirect(false); // �⺻�� false�̹Ƿ� ��������
		
		return forward;
	}

}
