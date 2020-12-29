package action.freeboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.freeboard.MyBasketListService;
import vo.ActionForward;
import vo.MyBasketBean;

public class MyBasketAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyBasketAction!");


//		HttpSession session = request.getSession();
//	    String id = (String)session.getAttribute("id");
//	      
//	    if(id == null) {
//	    	System.out.println("안돼 돌아가.");
//	    	id = "honggildong";
//	    } 
	      
	      
//		System.out.println("id : " + id);
		

		ActionForward forward = null;
		int page = 1; // 현재 페이지 번호 저장할 변수
		int limit = 10; // 페이지 당 표시할 게시물 수를 결정하는 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		svc.Mybasket.MyBasketListService myBasketListService = new MyBasketListService();
		int listCount = myBasketListService.getListCount();
		
		ArrayList<MyBasketBean> basketList = new ArrayList<MyBasketBean>();
		basketList = myBasketListService.get
		
		forward = new ActionForward();
		forward.setPath("/myPage/my_basket.jsp");
//		forward.setRedirect(true);

		return forward;
	}

}
