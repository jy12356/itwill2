package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDeleteProService;
import svc.MemberLoginProService;
import vo.ActionForward;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginProAction!");
		
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberLoginProService memberLoginProService = new MemberLoginProService();
		boolean isMember = memberLoginProService.registArticle(id, password);
		System.out.println(isMember);
		if(!isMember) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // �ڹٽ�ũ��Ʈ ���� �±�
			out.println("alert('�α��ο� �����Ͽ����ϴ�.')"); // ���̾�α� �޼��� ���
			out.println("history.back()"); // ���� �������� �̵�
			out.println("</script>"); // �ڹٽ�ũ��Ʈ �� �±�
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			forward = new ActionForward();
			forward.setPath("MemberList.bo");
			forward.setRedirect(false);	
		}
		
		return forward;
	}

}
