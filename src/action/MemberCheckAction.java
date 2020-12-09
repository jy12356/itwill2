package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberCheckService;
import vo.ActionForward;

public class MemberCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberCheckAction!");

		ActionForward forward = null;
		String id = request.getParameter("id");
		System.out.println("MemberCheckAction id : "+id);
		MemberCheckService memberCheckService = new MemberCheckService();
//		String data = null; 
		boolean isIdCheckSuccess = memberCheckService.registArticle(id);
		System.out.println(isIdCheckSuccess);

//		if (!isIdCheckSuccess) {
//			// "���̵��ߺ�"
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>"); // �ڹٽ�ũ��Ʈ ���� �±�
//			out.println("���̵� �ߺ�");
//			out.println("</script>"); // �ڹٽ�ũ��Ʈ �� �±�
//		} else {
//			// "���̵� ��밡��"
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>"); // �ڹٽ�ũ��Ʈ ���� �±�
//			out.println("���̵� ��밡��");
//			out.println("</script>"); // �ڹٽ�ũ��Ʈ �� �±�
//		}
		
		forward = new ActionForward();
		forward.setRedirect(false);
		return forward;
	}

}
