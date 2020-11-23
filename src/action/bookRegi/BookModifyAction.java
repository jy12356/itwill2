package action.bookRegi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;

public class BookModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		int book_num = Integer.parseInt(request.getParameter("board_num"));
		
		
		forward = new ActionForward();
		forward.setPath("BookDetail.bok?book_num?"+book_num);
		forward.setRedirect(true);
		
		return forward;
	}

}
