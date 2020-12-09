package action.book;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.book.BookDibsInsertService;
import svc.book.BookWriteService;
import vo.ActionForward;
import vo.BookBean;

public class BookDibsListInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookDibsListInsertAction!");
		ActionForward forward =null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String isbn = request.getParameter("isbn");
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('로그인을 해주셔야합니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		}else {
			BookDibsInsertService bookDibsInsertService = new BookDibsInsertService();
			boolean isDibsoverlap = bookDibsInsertService.checkBookDibsOverlap(isbn,id);
			if(isDibsoverlap == true) {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('찜바구니에 이미 존재하는 도서입니다..')"); // 다이얼로그 메세지 출력
				out.println("history.back()"); // 이전 페이지로 이동
				out.println("</script>"); // 자바스크립트 끝 태그
			}else {
				boolean isInsertSuccess = bookDibsInsertService.insertBookDibs(isbn,id);
				if(!isInsertSuccess) {
					response.setContentType("text/html; charset=UTF-8"); 
					PrintWriter out = response.getWriter();
					out.println("<script>"); // 자바스크립트 시작 태그
					out.println("alert('책찜 등록을 실패하였습니다.')"); // 다이얼로그 메세지 출력
					out.println("history.back()"); // 이전 페이지로 이동
					out.println("</script>"); // 자바스크립트 끝 태그
				} else {
					forward = new ActionForward();
					forward.setPath("BookDibsList.bok");
					forward.setRedirect(true);
				}
			}
		}
		return forward;
	}

}
