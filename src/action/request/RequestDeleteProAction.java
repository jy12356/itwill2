package action.request;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.request.RequestDeleteProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestDeleteProAction");
		
		ActionForward forward = null;

		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		System.out.println("DeleteActionPro ID : "+ id);

		RequestDeleteProService requestDeleteProService = new RequestDeleteProService();

		boolean isDeleteSuccess = requestDeleteProService.removeArticle(num);

		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제에 실패했어요')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("RequestList.rq?page=" + request.getParameter("page"));
			forward.setRedirect(true);
		}
	
		return forward;
	}

}