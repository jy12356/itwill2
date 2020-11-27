package action.request;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.request.RequestModifyProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestModifyProAction");

		ActionForward forward = null;

		int num = Integer.parseInt(request.getParameter("num"));
		
		RequestModifyProService requestModifyProService = new RequestModifyProService();
//		System.out.println("num : " +num);
//		System.out.println("id : " + request.getParameter("id"));
		boolean isRightUser = requestModifyProService.isArticleRequestWriter(num, request.getParameter("id"));
		if (!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			RequestBean article = new RequestBean();
			article.setNum(num);
			article.setSubject(request.getParameter("subject"));
			article.setAuthor(request.getParameter("author"));
			article.setPublisher(request.getParameter("publisher"));
			article.setPubdate(request.getParameter("pubdate"));
			article.setIsbn(request.getParameter("isbn"));
			article.setContent(request.getParameter("content"));
			article.setFile(request.getParameter("file"));
			
			boolean isModifySuccess = requestModifyProService.modifyArticle(article);

			if(!isModifySuccess) {
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
			
		}

		return forward;
	}

}