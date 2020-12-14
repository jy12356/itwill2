package action.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil;

import action.Action;
import svc.review.ReCommentListService;
import svc.review.ReviewListService;
import vo.ActionForward;
import vo.CommentBean;
import vo.PageInfo;
import vo.ReviewBean;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Action - 2.ReviewListAction!");
		
		ActionForward forward = null;
			
//		String isbn = request.getParameter("isbn");
//		String id = request.getParameter("id");
		String isbn = "2"; // 작업 후 삭제
		String id = "test"; // 작업 후 삭제
		System.out.println("책코드 : " + isbn);
		System.out.println("아이디 : " + id);
		
		// 서평 리스트 -------------------------------------------------------
		// 서평 수 확인 ----------
		ReviewListService reviewListService = new ReviewListService();
		
		int listCount = reviewListService.getListCount(isbn);
		System.out.println("전체게시물 수 : " + listCount);
		
		// 페이지 처리를 위한 변수 선언
		int page = 1; // 현재 페이지 번호 저장할 변수
		int limit = 10; // 페이지 당 표시할 게시물 수를 결정하는 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 서평 리스트 출력 ----------
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		articleList = reviewListService.getArticleList(page, limit, isbn);
		
		// 페이지 계산 작업 수행
		// 1. 전체 페이지 수 계산
		// 	  (총 게시물 수 / 페이지 당 게시물 수 + 0.95) -> 정수로 변화
		int maxPage = (int)((double)listCount / limit + 0.95);
		// 2. 현재 페이지에서 보여줄 시작 페이지 수(1, 11, 21페이지 등)
		int startPage = ((int)((double)page / 10 + 0.9) - 1) * 10 + 1;
		// 3. 현재 페이지에서 보여줄 마지막 페이지 번호(10, 20, 30 페이지 등)
		int endPage = startPage + 10 - 1;
		// 4. 마지막 페이지가 현재 페이지에서 표시할
		//	  최대페이지(전체 페이지) 수 보다 클 경우
		// 	  마지막 페이지 번호를 전체 페이지 번호로 대체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(
		page, maxPage, startPage, endPage, listCount);
		// request 객체의 setAtribute() 메서드를 호출하여
		// 게시물 목록 정보(ArrayList)와 페이지 정보(PageInfo) 객체를 저장
		
		request.setAttribute("articleList", articleList);			
		request.setAttribute("pageInfo", pageInfo);

		forward = new ActionForward();
		forward.setPath("/sub1/detail.jsp");
		
		return forward;
	}

}

// 댓글 수 ---------------------------------------------------------

//		ReCommentListService reCommentListService = new ReCommentListService();
//		int listCount2 = reCommentListService.getCommetListCount();
//		System.out.println("전체댓글 수 : " + listCount2);