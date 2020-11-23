package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.RequestModifyProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestModifyProAction");

		ActionForward forward = null;

		int num = Integer.parseInt(request.getParameter("num"));
		
		RequestBean article = new RequestBean();
		RequestModifyProService requestModifyProService = new RequestModifyProService();

		boolean isModifySuccess = requestModifyProService.modifyArticle(article);

		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("RequestDetail.rq?num=" + num + "&page=" + request.getParameter("page"));
			forward.setRedirect(true);
		}

		return forward;
	}

}