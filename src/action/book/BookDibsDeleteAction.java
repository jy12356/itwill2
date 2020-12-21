package action.book;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.book.BookDeleteProService;
import svc.book.BookDibsDeleteService;
import vo.ActionForward;

public class BookDibsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookDibsDeleteAction");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<Integer> inerNumList = new ArrayList();
		String[] checkArr=request.getParameterValues("inter_num[]");
		for(int i = 0; i<checkArr.length; i++) {
			inerNumList.add(Integer.parseInt(checkArr[i]));
		}
				
		BookDibsDeleteService bookDibsDeleteService = new BookDibsDeleteService(); 
		boolean isBookInterDel =  bookDibsDeleteService.dibsDelete(inerNumList,id);

		if(!isBookInterDel) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제하였습니다.')");
			out.println("</script>");
		}
		
		return null;
	}


}
