package action.member;

import java.io.PrintWriter;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
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
		try {
			boolean isMember = memberLoginProService.registArticle(id, password);
			System.out.println(isMember);

			if(isMember) {
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("Main.book"); 
			}
		} catch (LoginException e) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + e.getMessage() + "')"); // 실패 메세지 출력
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}

