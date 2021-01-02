package action.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.book.BookDetailService;
import svc.review.ReCommentListService;
import svc.review.ReviewListService;
import vo.ActionForward;
import vo.BookBean;
import vo.CommentBean;
import vo.PageInfo;
import vo.ReviewBean;

public class BookDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookDetailAction");
		ActionForward forward = null;
		String book_isbn=request.getParameter("isbn");
		String page=request.getParameter("page");
		
		//책정보
		BookDetailService bookDetailService = new BookDetailService();
		BookBean bookBean = bookDetailService.getBookInfo(book_isbn);
		//서평
		ReviewListService reviewListService = new ReviewListService();
		int listCount = reviewListService.getListCount(book_isbn);
		System.out.println("전체게시물 수 : " + listCount);
		request.setAttribute("bookBean", bookBean);
		
		// 서평 리스트 출력 ----------
		// 페이지 처리를 위한 변수 선언
		int page1 = 1; // 현재 페이지 번호 저장할 변수
		int limit = 0; // 페이지 당 표시할 게시물 수를 결정하는 변수
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		} else {
			limit = 10;
		}

		if (request.getParameter("page") != null) {
			page1 = Integer.parseInt(request.getParameter("page"));
		}

		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		articleList = reviewListService.getArticleList(page1, limit, book_isbn);

		// 댓글 리스트 출력 -----
//		int board_num =Integer.parseInt(request.getParameter("booknum"));
//		int board_type = 2;		
//		ReCommentListService reCommentListService = new ReCommentListService();
//		ArrayList<CommentBean> commentList = new ArrayList<CommentBean>();
//		System.out.println("Action 댓글리스트 출력 시작!");
//		commentList = reCommentListService.getArticleList(page1, limit, board_num, board_type);
		// 페이지 계산 작업 수행
		// 1. 전체 페이지 수 계산
		// 	  (총 게시물 수 / 페이지 당 게시물 수 + 0.95) -> 정수로 변화
		int maxPage = (int)((double)listCount / limit + 0.95);
		// 2. 현재 페이지에서 보여줄 시작 페이지 수(1, 11, 21페이지 등)
		int startPage = ((int)((double)page1 / 10 + 0.9) - 1) * 10 + 1;
		// 3. 현재 페이지에서 보여줄 마지막 페이지 번호(10, 20, 30 페이지 등)
		int endPage = startPage + 10 - 1;
		// 4. 마지막 페이지가 현재 페이지에서 표시할
		//	  최대페이지(전체 페이지) 수 보다 클 경우
		// 	  마지막 페이지 번호를 전체 페이지 번호로 대체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(page1, maxPage, startPage, endPage, listCount);
		// request 객체의 setAtribute() 메서드를 호출하여
		// 게시물 목록 정보(ArrayList)와 페이지 정보(PageInfo) 객체를 저장
		
		request.setAttribute("articleList", articleList);		

//		request.setAttribute("commentList", commentList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("limit", limit);
		
		forward = new ActionForward();
		forward.setPath("/sub1/bookDetail.jsp?isbn="+book_isbn);
		
		return forward;
	}

}
