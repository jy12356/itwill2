package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.RequestDeleteProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestDeleteProAction");
		
		ActionForward forward = null;

		int num = Integer.parseInt(request.getParameter("num"));

		RequestBean article = new RequestBean();
		RequestDeleteProService boardDeleteProService = new RequestDeleteProService();
	
		boolean isArticleWriter = boardDeleteProService.removeArticle(article);

		if(!isArticleWriter) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
				boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);

			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath(
						"BoardList.bo?page=" + request.getParameter("page"));
				forward.setRedirect(true);
			}
		}
	
		return forward;
	}

}