package action.rental;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.rental.rentalListService;
import svc.rental.ReservationListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.RentalBean;
import vo.ReservationBean;

public class ReservationListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReservationListAction!");
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("아이디 id : " +id);
		
		if (id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('로그인을 해주셔야합니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		} else {
			int page = 1;
			int limit = 10; 
			
			
			System.out.println("ReservationListAction - 1");
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			System.out.println("ReservationListAction - 2");
			System.out.println("page : " + page);
			ReservationListService reservationListService = new ReservationListService();
			
			int listCount = reservationListService.getListCount(id);
			
			System.out.println("listCount : " + listCount);

			System.out.println("ReservationListAction - 3");
			
			ArrayList<ReservationBean> reservationList = new ArrayList<ReservationBean>();
			reservationList = reservationListService.getReservationList(page, limit, id);
			
			int maxPage = (int)((double)listCount/ limit+0.95);
			int startPage = ((int)((double)page/10+0.9)-1)*10+1;
			int endPage=startPage+10-1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
			System.out.println("reservationListAciton - 5");
			request.setAttribute("reservationList", reservationList);
			request.setAttribute("pageInfo", pageInfo);
			System.out.println("reservationListAciton - 6");
			
			
			forward = new ActionForward();
			forward.setPath("/myPage/reservation.jsp");
			
			
			
			
		}
		
		
		
		return forward;
	}

}
















