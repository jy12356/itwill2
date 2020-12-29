package action.freeboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.freeboard.CommentDetailService;
import svc.freeboard.FBCommentListService;
import svc.freeboard.FreeBoardDetailService;
import vo.ActionForward;
import vo.CommentBean;
import vo.FreeBoardBean;
import vo.PageInfo;

// 게시물 목록에서 클릭된 게시물에 대한 상세 내용을 가져오기 위한 클래스
// => 1개 게시물의 상세 내용을 가져와서 qna_board_view.jsp 페이지로 전달
public class FreeBoardDetailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FreeBoardDetailAction!");
		
		System.out.println("action 넘어온값 : "+request.getParameter("limit"));
		
//		System.out.println("b값 가져오나? " + request.getParameter("b"));
		ActionForward forward = null;

		// 파라미터로 전달받은 게시물 번호(board_num) 가져오기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_type = Integer.parseInt(request.getParameter("board_type"));
//		int b = Integer.parseInt(request.getParameter("b"));
		
		System.out.println("게시물 번호 : " + board_num);
		System.out.println("게시판 타입 : " + Integer.parseInt(request.getParameter("board_type")));
//		System.out.println(b);
		// BoardDetailService 클래스의 인스턴스 생성 후
		// getArticle() 메서드를 호출하여 게시물 번호에 해당하는 글내용 가져오기
		// => 파라미터 : 글번호(board_num), 리턴타입 : 게시물 1개 정보(BoardBean)
		FreeBoardDetailService boardDetailService = new FreeBoardDetailService();
		FreeBoardBean article = boardDetailService.getArticle(board_num);

		// ====================== 댓글리스트1 ========================
		System.out.println("FreeBoardDetailAction - 댓글리스트뿌리기");

		int page = 1; // 현재 페이지 번호 저장할 변수
		System.out.println("1");
		int limit = 0;
		if(request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit")); // 페이지 당 표시할 게시물 수를 결정하는 변수
		} else {
			limit = 10;
		}
		
		
System.out.println("FreeBoardDetailAction - page 가져오나? " + Integer.parseInt(request.getParameter("page")));
System.out.println("2");

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("3");

		FBCommentListService fbCommentListService = new FBCommentListService();
		int listCount = fbCommentListService.getListCount();
		System.out.println("4");

		ArrayList<CommentBean> commentList = new ArrayList<CommentBean>();
		commentList = fbCommentListService.getCommentList(page, limit, board_type, board_num);
		System.out.println("5");

		int maxPage = (int) ((double) listCount / limit + 0.95);

		// 2. 현재 페이지에서 보여줄 시작 페이지 번호(1, 11, 21 페이지 등)
		int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;

		// 3. 현재 페이지에서 보여줄 마지막 페이지 번호(10, 20, 30 페이지 등)
		int endPage = startPage + 10 - 1;

		// 4. 마지막 페이지가 현재 페이지에서 표시할
		// 최대 페이지(전체 페이지) 수 보다 클 경우
		// 마지막 페이지 번호를 전체 페이지 번호로 대체
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println("6");

		PageInfo pageInfo = new PageInfo(
				page, maxPage, startPage, endPage, listCount);
		
		System.out.println("7");

		CommentDetailService commentDetailService = new CommentDetailService();
		System.out.println("FreeBoardDetailAction 대댓글작업중");
		System.out.println("8");

		
//		if() {
			
			CommentBean cb = commentDetailService.getComment(board_type, board_num);
			
			int entireCount = commentDetailService.getCount(board_type, board_num);
			System.out.println("1");
			// request에 comment정보 CommentBean 저장
			// ====================== 댓글리스트1 ========================
			request.setAttribute("comment", cb);
			request.setAttribute("entireCount", entireCount);
			System.out.println("2");

			request.setAttribute("commentList", commentList);
			request.setAttribute("limit", limit);
			System.out.println("3");

//		} else {
//			System.out.println("코멘트가없어서 페이지못띄움 오류");
//		}

//		int b = Integer.parseInt(request.getParameter("b"));
		
//		int c = article.getB();
//		c = c+10;
//		request.setAttribute("c",c);
		
		// 글내용이 저장된 BoardBean 객체를 request 객체에 저장
		request.setAttribute("article", article);
		System.out.println("4");
//		request.setAttribute("b", b);
		
		request.setAttribute("pageInfo", pageInfo);
		System.out.println("5");

		// board 폴더 내의 qna_board_view.jsp 페이지로 포워딩
		// => request 객체를 유지하고, 서블릿 주소가 유지되어야 하므로
		// Dispatcher 방식으로 포워딩
		forward = new ActionForward();
		forward.setPath("/sub2/free_board_view.jsp");
//		forward.setRedirect(false); // 생략 가능

		return forward;
	}

}
