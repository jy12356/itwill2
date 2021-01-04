package action.book;

import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookListService;
import vo.ActionForward;
import vo.BookBean;
import vo.PageInfo;

public class BookListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookListAction");
		ActionForward forward = null;
		request.setCharacterEncoding("utf-8");
		int page = 1;//현재 페이지 번호 저장할 변수
		int limit = 10; //페이지당 표시할 게시물 수를 결정하는 변수
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}


		System.out.println("제발제발제 "+(String)request.getParameter("catg1"));
		System.out.println("제발제발제 "+(String)request.getParameter("catg2"));
		System.out.println(URLDecoder.decode(request.getParameter("catg1"),"UTF-8"));
		System.out.println(URLDecoder.decode(request.getParameter("catg2"),"UTF-8"));
		String catg1 = "";
		String catg2 = "";
		String search="";
		if(request.getParameter("catg1") != null) {
			catg1 = new String(request.getParameter("catg1").getBytes("8859_1"),"UTF-8");
		}
		if(request.getParameter("catg2") != null) {
			catg2 =  new String(request.getParameter("catg2").getBytes("8859_1"),"UTF-8");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		System.out.println("12121221121222"+catg1);
		System.out.println("1212121"+catg2);
		BookListService bookListService = new BookListService();
		int listCount = bookListService.getListCount(catg1,catg2,search);
		System.out.println("전체 게시물 수 : " + listCount);
		
		
		
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		bookList = bookListService.getBookList(page,limit,catg1,catg2,search);

		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		request.setAttribute("bookList", bookList);
		request.setAttribute("pageInfo", pageInfo);
		forward = new ActionForward();
		forward.setPath("/sub1/bookList.jsp");
		return forward;
		
	}


}
