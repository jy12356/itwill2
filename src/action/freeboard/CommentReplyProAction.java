package action.freeboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;

public class CommentReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("CommentReplyProAction!");
		
		
		ActionForward forward = null;
		System.out.println(" CommentWriteProAction - 페이지가져와?  " + Integer.parseInt(request.getParameter("page")));

		
		
		return null;
	}

}
