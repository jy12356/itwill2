package action.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.RequestDetailService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("RequestModifyFormAction");
		
		ActionForward forward = null;

		int num = Integer.parseInt(request.getParameter("num"));

		RequestDetailService requestDetailService = new RequestDetailService();
		RequestBean article = requestDetailService.getArticle(num);

		request.setAttribute("article", article);

		forward = new ActionForward();
		forward.setPath("/sub4/request_board_modify.jsp");
		
		return forward;
	}

}