package action.book;

import java.io.PrintWriter;

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
		String title = request.getParameter("title");
		String isbn = request.getParameter("isbn");
		System.out.println("1111"+title);
		System.out.println("222222"+isbn);
		
		BookDeleteProService bookDeleteProService = new BookDeleteProService(); 
		boolean isBookExis =  bookDeleteProService.bookExis(book_num);
		if(!isBookExis) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			boolean isDelete = bookDeleteProService.bookdelete(book_num);
			if(!isDelete) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제에 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				forward = new ActionForward();
				forward.setPath("BookKindList.bok?title="+ title+"&isbn="+isbn);
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}
	
}
