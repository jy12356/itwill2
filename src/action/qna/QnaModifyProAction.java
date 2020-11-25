package action.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qna.QnaModifyProService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaModifyProAction");
		
		ActionForward forward = null;
//		System.out.println(Integer.parseInt(request.getParameter("board_num")));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		QnaBean article = new QnaBean();
		article.setQna_genre(request.getParameter("qna_genre"));
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("content"));
		article.setContent2(request.getParameter("content2"));
		article.setBoard_num(board_num);
		QnaModifyProService qnaModifyProService = new QnaModifyProService();
		boolean isModifySuccess = qnaModifyProService.modifyArticle(article);
		
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("QnaDetail.qna?board_num=" + board_num+ "&page="+request.getParameter("page"));
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
