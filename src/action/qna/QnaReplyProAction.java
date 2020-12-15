package action.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qna.QnaReplyProService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaReplyProAction - ActionForward" );
		
		ActionForward forward = null;
		QnaBean article = new QnaBean();
		
		article.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		article.setId(request.getParameter("id"));
		System.out.println(request.getParameter("id"));
		article.setPass(request.getParameter("pass"));
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("content"));
		article.setContent2(request.getParameter("content2"));
		article.setQna_genre(request.getParameter("qna_genre"));
		article.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		article.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		article.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		QnaReplyProService qnaReplyProService = new QnaReplyProService();
		boolean isReplySuccess = qnaReplyProService.replyArticle(article);
		
		if(!isReplySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("QnaList.qna?page=" + request.getParameter("page"));
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
