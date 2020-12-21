package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import vo.ActionForward;

public class MemberLogoutProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLogoutProAction");
		ActionForward forward =null;
		
		HttpSession session = request.getSession();
		session.invalidate(); //초기화
		//만약, id에 해당하는 세션값만 삭제해야할 경우
//		session.removeAttribute("id");
		forward = new ActionForward();
		forward.setPath("Main.book");
//		forward.setPath("/main/index.jsp");
		forward.setRedirect(true); 
		return forward;
	}

}
