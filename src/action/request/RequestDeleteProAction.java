package action.request;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.RequestDeleteProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestDeleteProAction");
		
		ActionForward forward = null;

		int num = Integer.parseInt(request.getParameter("num"));

		RequestDeleteProService requestDeleteProService = new RequestDeleteProService();
		
		boolean isRightUser = requestDeleteProService.isArticleRequestWriter(num, request.getParameter("id"));

		
		if(!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			RequestBean article = new RequestBean();
			article.setNum(num);
			boolean isDeleteSuccess = requestDeleteProService.removeArticle(article);

			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("RequestList.rq?page=" + request.getParameter("page"));
				forward.setRedirect(true);
			}
		}
	
		return forward;
	}

}