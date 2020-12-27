package action.rental;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Mybasket.MyBasketInsertService;
import svc.rental.RentalInsertService;
import svc.rental.ReturnInsertService;
import vo.ActionForward;
import vo.RentalBean;

public class returnInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("returnInsertAction!");
		ActionForward forward = null;
		
		String state = request.getParameter("state");
		RentalBean rentalBean = new RentalBean();
		rentalBean.setState(state);
		
		ReturnInsertService returnInsertService = new ReturnInsertService();
		boolean isWriteSuccess = returnInsertService.registArticle(rentalBean);
		
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구매 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("Return2.rn");
			forward.setRedirect(true);
		}
		return forward;
	}

}
