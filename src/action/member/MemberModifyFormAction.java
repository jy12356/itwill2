package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import action.Action;
import svc.MemberModifyFormService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModifyFormAction implements Action {


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("MemberModifyFormAction");
				ActionForward forward = null;
				
				// ���� �Խù� ���� ��û�� �ʿ��� �۹�ȣ(board_num) �Ķ���� ��������
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");
				System.out.println(id);
				// ���� �Խù� ���� ��û�� ���� ���ο� Service Ŭ������ �������� �ʰ�
				// ������ BoardDetailService Ŭ������ getArticle() �޼��带 ȣ���Ͽ�
				// ���� �Խù� ���� ��û�� ����
				// => �Ķ���� : �۹�ȣ(board_num), ����Ÿ�� : BoardBean(article)
				MemberModifyFormService memberModifyFormService = new MemberModifyFormService();
				MemberBean article = memberModifyFormService.getArticle(id);
				
				// request ��ü�� ���� �Խù� ���� (BoardBean) ����
				request.setAttribute("article", article);
				
				// ActionForward ��ü�� �����Ͽ� qna_board_modify.jsp �������� ������
				// => Dispatcher ���
				forward = new ActionForward();
				forward.setPath("/sub1/update.jsp");
				return forward;
	}

}
