package action.bookRegi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookDetailService;
import vo.ActionForward;
import vo.BookBean;

public class BookDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookDetailAction");
		ActionForward forward = null;
		String book_isbn=request.getParameter("isbn");
		String title=request.getParameter("title");
		String page=request.getParameter("page");
		
		BookDetailService bookDetailService = new BookDetailService();
		BookBean bookBean = bookDetailService.getBookInfo(book_isbn,title);
		request.setAttribute("bookBean", bookBean);
		forward = new ActionForward();
		forward.setPath("/sub1/bookDetail.jsp?isbn="+bookBean.getIsbn()+"&page="+page+"&title="+bookBean.getTitle());
		
		return forward;
	}

}
