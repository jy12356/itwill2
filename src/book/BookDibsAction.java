package book;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookDeleteProService;
import vo.ActionForward;

public class BookDibsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String isbn = request.getParameter("isbn");
		System.out.println("222222"+isbn);
		
		BookDeleteProService bookDeleteProService = new BookDeleteProService(); 
		boolean isDelete = bookDeleteProService.bookdelete(isbn);
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
	
		
		return forward;
	}
	
}
