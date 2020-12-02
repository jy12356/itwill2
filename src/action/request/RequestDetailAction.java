package action.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.request.RequestDetailService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestDetailAction");
		
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		RequestDetailService requestDetailService = new RequestDetailService();
		RequestBean article = requestDetailService.getArticle(num);
		
		request.setAttribute("article", article);

		
		forward = new ActionForward();
		forward.setPath("/sub4/request_board_detail.jsp");
		
		return forward;
	}

}
