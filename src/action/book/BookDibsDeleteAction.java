package action.book;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookDeleteProService;
import svc.book.BookDibsDeleteService;
import vo.ActionForward;

public class BookDibsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		String id = request.getParameter("id");
	
		List<Integer> num = List request.getParameter("chbox");
		
		BookDibsDeleteService bookDibsDeleteService = new BookDibsDeleteService(); 
		boolean isBookDel =  bookDibsDeleteService.dibsDelete(id,num);
		if(!isBookDel) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 삭제되었습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			boolean isDelete = bookDibsDeleteService.dibsDelete(id,num);
			if(!isDelete) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				
				out.println("alert('삭제에 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				forward = new ActionForward();
				forward.setPath("BookDibsList.bok");
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}


}
