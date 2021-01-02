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
				
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");
				System.out.println(id);
				MemberModifyFormService memberModifyFormService = new MemberModifyFormService();
				MemberBean article = memberModifyFormService.getArticle(id);
				
				request.setAttribute("article", article);
				
				forward = new ActionForward();
				forward.setPath("/sub1/update.jsp");
				return forward;
	}

}
