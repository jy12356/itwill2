package action.bookRegi;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookListService;
import vo.ActionForward;
import vo.BookBean;

public class BookListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookListAction");
		ActionForward forward = null;
		
		int page = 1;//현재 페이지 번호 저장할 변수
		int limit = 10; //페이지당 표시할 게시물 수를 결정하는 변수
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}
		BookListService bookListService = new BookListService();
		int listCount = bookListService.getListCount();
		System.out.println("전체 게시물 수 : " + listCount);
		
		
		
		ArrayList<BookBean> articleList = new ArrayList<BookBean>();
		
		return forward;
		
	}


}
