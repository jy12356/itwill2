package action.bookRegi;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookKindListService;
import vo.ActionForward;
import vo.BookBean;
import vo.PageInfo;

public class BookKindListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookKindListAction");
		ActionForward forward = null;
		int page = 1;
		int limit = 10; 
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}
		String title = request.getParameter("title");
		String isbn = request.getParameter("isbn");
		BookKindListService bookKindListService = new BookKindListService();
		int listCount = bookKindListService.getListCount(title, isbn);
		ArrayList<BookBean> bookList = bookKindListService.bookKindList(title,isbn, page, limit);
		int maxPage = (int)((double)listCount/ limit+0.95);
		int startPage = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage=startPage+10-1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("pageInfo", pageInfo);
		forward = new ActionForward();
		forward.setPath("/adminPage/bookKindList.jsp");
				
		return forward;
	}
	
}
