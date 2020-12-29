package action.rental;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.rental.rentalListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.RentalBean;

public class returnAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("returnAction!");
		ActionForward forward = null;
		
		int page = 1;
		int limit = 10; 
		System.out.println("RentalListAction - 1");

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("RentalListAction - 2");
		System.out.println("page : " + page);
		
		rentalListService rentalListService = new rentalListService();
		
		int listCount = rentalListService.getListCountt();
		System.out.println("listCount : " + listCount);

		System.out.println("RentalListAction - 3");

		
		ArrayList<RentalBean> rentalList = new ArrayList<RentalBean>();
		rentalList = rentalListService.getRentalListt(page, limit);
		
		int maxPage = (int)((double)listCount/ limit+0.95);
		int startPage = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage=startPage+10-1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		System.out.println("RentalListAction - 5");
		request.setAttribute("rentalList", rentalList);
		request.setAttribute("pageInfo", pageInfo);
		System.out.println("RentalListAction - 6");

		forward = new ActionForward();
		forward.setPath("/sub5/return.jsp");
		
		return forward;
	}

}
