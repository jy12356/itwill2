package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SearchAllListService;
import svc.book.MainListService;
import vo.ActionForward;
import vo.BookBean;
import vo.FreeBoardBean;
import vo.NoticeBean;
import vo.PageInfo;
import vo.QnaBean;

public class SearchAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SearchAllAction");
		ActionForward forward = null;
		response.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		System.out.println(search);
		ArrayList<BookBean> bookAllList = new ArrayList<BookBean>();
		bookAllList = SearchAllListService.getBookSearchAllList(search);
		request.setAttribute("bookAllList", bookAllList);
		

		ArrayList<FreeBoardBean> freeBAllList = new ArrayList<FreeBoardBean>();
		freeBAllList = SearchAllListService.getFreeSearchAllList(search);
		request.setAttribute("freeBAllList", freeBAllList);
		
		
		ArrayList<QnaBean> qnaAllList = new ArrayList<QnaBean>();
		qnaAllList = SearchAllListService.getNoticeSearchAllList(search);
		request.setAttribute("qnaAllList", qnaAllList);
		
		
		ArrayList<NoticeBean> noticeAllList  = new ArrayList<NoticeBean>();
		noticeAllList = SearchAllListService.selectNoticeAllList(search);
		request.setAttribute("noticeAllList", noticeAllList);
		
		forward = new ActionForward();
		forward.setPath("/sub1/searchAllList.jsp");
		System.out.println("MasinListAction 끝");
		return forward;
	}

}
