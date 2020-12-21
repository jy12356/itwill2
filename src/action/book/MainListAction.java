package action.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookListService;
import svc.book.MainListService;
import vo.ActionForward;
import vo.BookBean;
import vo.PageInfo;

public class MainListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainListAction");
		System.out.println("최신순");
		ActionForward forward = null;
		
		int page = 1;//현재 페이지 번호 저장할 변수
		int limit = 6; //페이지당 표시할 게시물 수를 결정하는 변수
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}
		String catg1 = "";
		String catg2 = "";
		String search="";
		if(request.getParameter("catg1") != null) {
			catg1 = request.getParameter("catg1");
		}
		if(request.getParameter("catg2") != null) {
			catg2 = request.getParameter("catg2");
		}
		MainListService mainListService = new MainListService();
		int listCount = mainListService.getListCount();
		System.out.println("전체 게시물 수 : " + listCount);
		
		ArrayList<BookBean> bookList = new ArrayList<BookBean>();
		bookList = mainListService.getBookList(page,limit,catg1,catg2,search);
		int maxPage = (int)((double)listCount/ limit+0.95);
		int startPage = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage=startPage+10-1;
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		ArrayList<BookBean> bookList2 = new ArrayList<BookBean>();
		bookList2 = mainListService.getBookList2(page,limit,catg1,catg2);
		int maxPage2 = (int)((double)listCount/ limit+0.95);
		int startPage2 = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage2 = startPage+10-1;
		PageInfo pageInfo2 = new PageInfo(page, maxPage, startPage, endPage, listCount);
		System.out.println("bookList2.size" + bookList2.size());
		
		ArrayList<BookBean> bookList3 = new ArrayList<BookBean>();
		bookList3 = mainListService.getBookList3(page,limit,catg1,catg2);
		int maxPage3 = (int)((double)listCount/ limit+0.95);
		int startPage3 = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage3 = startPage+10-1;
		PageInfo pageInfo3 = new PageInfo(page, maxPage, startPage, endPage, listCount);
		System.out.println("bookList3.size" + bookList3.size());
		
		ArrayList<BookBean> bookList4 = new ArrayList<BookBean>();
		bookList4 = mainListService.getBookList4(page,limit,catg1,catg2);
		int maxPage4 = (int)((double)listCount/ limit+0.95);
		int startPage4 = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage4 = startPage+10-1;
		PageInfo pageInfo4 = new PageInfo(page, maxPage, startPage, endPage, listCount);
		System.out.println("bookList4.size" + bookList4.size());
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("pageInfo", pageInfo);
		
		request.setAttribute("bookList2", bookList2);
		request.setAttribute("pageInfo2", pageInfo2);
		
		request.setAttribute("bookList3", bookList3);
		request.setAttribute("pageInfo3", pageInfo3);
		
		request.setAttribute("bookList4", bookList4);
		request.setAttribute("pageInfo4", pageInfo4);
		
		forward = new ActionForward();
		forward.setPath("/main/index.jsp");
		System.out.println("MasinListAction 끝");
		return forward;
		
	}


}
