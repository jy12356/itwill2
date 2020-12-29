package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class AdminAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAction");

		ActionForward forward = null;
		forward = new ActionForward();
		forward.setPath("/adminPage/adminpage.jsp");
		System.out.println("AdminAction 끝");
		return forward;
	}

}
