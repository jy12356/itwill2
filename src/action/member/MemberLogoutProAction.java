package action.member;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vo.ActionForward;
import action.Action;

public class MemberLogoutProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLogoutProAction");
		ActionForward forward = null;
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.invalidate(); //초기화
		forward = new ActionForward();
		forward.setPath("Main.book");
		forward.setRedirect(true);	
		System.out.println(forward.getPath());
		System.out.println(forward.isRedirect());
		return forward;

	}

}
