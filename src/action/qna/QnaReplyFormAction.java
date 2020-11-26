package action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qna.QnaDetailService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaReplyFormAction - ActionForward");
		
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		QnaDetailService qnaDetailService = new QnaDetailService();
		QnaBean article = qnaDetailService.getArticle(board_num);
		
		request.setAttribute("article", article);
		
		forward = new ActionForward();
		forward.setPath("/sub5/qna5.jsp");
		
		return forward;
	}

}
