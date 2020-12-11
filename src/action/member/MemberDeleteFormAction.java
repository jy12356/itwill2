package action.member;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDeleteFormService;
import svc.MemberDeleteProService;
import svc.MemberWriteProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberDeleteFormAction implements Action {

	@Override

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteFormAction");
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		MemberDeleteFormService memberDeleteFormService = new MemberDeleteFormService();
		MemberBean article = memberDeleteFormService.getArticle(id);
		
		request.setAttribute("article", article);
		
		forward = new ActionForward();
		forward.setPath("/sub1/delete.jsp");
		return forward;
	}

}
