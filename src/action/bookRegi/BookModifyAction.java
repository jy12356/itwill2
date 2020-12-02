package action.bookRegi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookDetailService;
import vo.ActionForward;
import vo.BookBean;

public class BookModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		String page = request.getParameter("page");
//		String title = request.getParameter("title");
		String isbn = request.getParameter("isbn");
		BookDetailService bookDetailService = new BookDetailService();
		BookBean bookBean = bookDetailService.getBookInfo(isbn);
		request.setAttribute("bookBean", bookBean);
		forward = new ActionForward();
		forward.setPath("/adminPage/book_modifyForm.jsp?&isbn="+isbn+"&page="+page);
		return forward;
	}

}
