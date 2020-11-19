package action.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qna.QnaListService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaListAction");
		
		ActionForward forward = null;
		
		// 페이징 처리를 위한 변수 선언
		int page = 1; // 현재 페이지 번호 저장할 변수
		int limit = 10; // 페이지 당 표시할 게시물 수를 결정하는 변수
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		QnaListService qnaListService = new QnaListService();
		int listCount = qnaListService.getListCount();
		
		ArrayList<QnaBean> articleList = new ArrayList<QnaBean>();
		articleList = qnaListService.getArticleList(page, limit);
		
		return forward;
	}

}
