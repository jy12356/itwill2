package action.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qna.QnaDetailService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaDetailAction - ActionForward");
		
		ActionForward forward = null;
//		System.out.println("QnaDetailAction boardnum: "+request.getParameter("board_num"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		QnaDetailService qnaDetailService = new QnaDetailService();
		QnaBean article = qnaDetailService.getArticle(board_num);
		
		request.setAttribute("article", article);
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/sub5/qna3.jsp?page="+page);
		
		return forward;
	}

}
