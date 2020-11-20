package action.bookRegi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookDeleteProService;
import vo.ActionForward;

public class BookDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		BookDeleteProService bookDeleteProService = new BookDeleteProService(); 
		bookDeleteProService.bookdelete(book_num);
		forward.setPath("");
		forward.setRedirect(true);
		return forward;
	}
	
}
