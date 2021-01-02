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
		request.setCharacterEncoding("utf-8");
		ActionForward forward = null;
		String catg1= request.getParameter("catg1");
		String catg2= request.getParameter("catg2");
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		System.out.println(catg1);
		System.out.println(catg2);
				
		BookDeleteProService bookDeleteProService = new BookDeleteProService(); 
		boolean isBookExis =  bookDeleteProService.bookExis(book_num);
		if(!isBookExis) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 삭제된 도서입니다.')");
			out.println("history.go(-2)");
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
				forward.setPath("BookList.bok?catg1="+catg1+"&catg2="+catg2);
				System.out.println(forward.getPath());
			}
		}
		
		return forward;
	}
	
}
