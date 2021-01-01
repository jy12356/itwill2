package action.returned;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.rental.rentalListService;
import svc.returned.ReturnedListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.RentalBean;
import vo.ReturnedBean;

public class ReturnedListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReturnedListAction!");
		ActionForward forward = null;
		
		int page = 1;
		int limit = 10; 
		System.out.println("ReturnedListAction - 1");

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("ReturnedListAction - 2");
		System.out.println("page : " + page);
		
		ReturnedListService returnedListService = new ReturnedListService();
		int listCount = returnedListService.getListCount();
		System.out.println("listCount : " + listCount);

		System.out.println("ReturnedListAction - 3");

		ArrayList<ReturnedBean> articleList = new ArrayList<ReturnedBean>();
		articleList = returnedListService.getArticleList(page, limit);
		
		int maxPage = (int)((double)listCount/ limit+0.95);
		int startPage = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage=startPage+10-1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		System.out.println("ReturnedListAction - 5");
		request.setAttribute("articleList", articleList);
		request.setAttribute("pageInfo", pageInfo);
		System.out.println("ReturnedListAction - 6");

		forward = new ActionForward();
		forward.setPath("/sub5/return2.jsp");
		
		return forward;
	}

}
