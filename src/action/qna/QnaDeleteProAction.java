package action.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qna.QnaDeleteProService;
import vo.ActionForward;

public class QnaDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaDeleteProAction - ActionForward");
		
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		QnaDeleteProService qnaDeleteProService = new QnaDeleteProService();
		boolean isDeleteSuccess = 
				qnaDeleteProService.removeArticle(board_num);
		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath(
					"QnaList.qna?page=" + request.getParameter("page"));
			forward.setRedirect(true);
		}
		return forward;
	}

}
