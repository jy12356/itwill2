package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardListService;
import vo.ActionForward;
import vo.BoardBean;
import vo.PageInfo;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListAction");
		ActionForward forward =  null;
		
		int page = 1; //현재 페이지 번호 저장할 변수
		int limit = 10; //페이지 당 표시할 게시물 수를 결정하는 변수
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		BoardListService boardlistservice = new BoardListService();
		int listCount = boardlistservice.getListCount();
		System.out.println("전체 게시글 수 : " + listCount);
		
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		articleList = boardlistservice.getArticleList(page,limit);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = ((int)((double)page / 10 + 0.9)-1);
		int endPage = startPage + 10 -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageinfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		return forward;
	}

}
