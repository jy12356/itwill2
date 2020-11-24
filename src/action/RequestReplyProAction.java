package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.RequestReplyProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestReplyProAction!");
		
		ActionForward forward = null;
		
		RequestBean article = new RequestBean();
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setId(request.getParameter("id"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		article.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		article.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		RequestReplyProService requestReplyProService = new RequestReplyProService();
		boolean isReplySuccess = RequestReplyProService.replyArticle(article);
		
		System.out.println(article.toString());

		if(!isReplySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글 등록 실패!')");
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
