package action.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.qna.QnaListService;
import vo.ActionForward;
import vo.PageInfo;
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
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		request.setAttribute("articleList", articleList);
		request.setAttribute("pageInfo", pageInfo);
		
		forward = new ActionForward();
		forward.setPath("/sub5/qna2.jsp");
		
		return forward;
	}

}
