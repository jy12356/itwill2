package action.review;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import svc.review.ReCommentListService;
import svc.review.ReviewListService;
import vo.ActionForward;
import vo.CommentBean;
import vo.PageInfo;
import vo.ReviewBean;

public class ReCommentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); 
		System.out.println("Action - ReCommentListAction!");
		ActionForward forward = null;
		
		String book_isbn = request.getParameter("isbn");
		String page=request.getParameter("page");
		System.out.println("책코드 : " + book_isbn);
		System.out.println("페이지번호 : " + page);
		
		String id = request.getParameter("id");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_type = Integer.parseInt(request.getParameter("board_type"));		
		System.out.println("아이디 : " + id);
		System.out.println("게시물 번호 : " + board_num);
		System.out.println("게시판 타입 : " + board_type);

		
		// 댓글 수 확인
		ReCommentListService reCommentListService = new ReCommentListService();
		
		int listCount = reCommentListService.getListCount(board_num, board_type);
		System.out.println("전체게시물 수 : " + listCount);
		System.out.println("Action 댓글수 확인!");
		
		
		// 페이지 계산 작업 수행 ------------------------------------------
		int page2 = 1; // 현재 페이지 번호 저장할 변수
		int limit = 10; // 페이지 당 표시할 게시물 수를 결정하는 변수
		
		// request 객체로부터 "page" 파라미터가 전달됐을 경우(null 이 아닐 경우)
		// 해당 파라미터 값을 page 변수에 저장
		if (request.getParameter("page") != null) {
			page2 = Integer.parseInt(request.getParameter("page"));
		}

		// 댓글 리스트 출력 -----
		ArrayList<CommentBean> articleList = new ArrayList<CommentBean>();
		System.out.println("Action 댓글리스트 출력 시작!");
		articleList = reCommentListService.getArticleList(page2, limit, board_num, board_type);
		System.out.println("Action 댓글리스트  service -> action 돌아옴");

		int maxPage = (int)((double)listCount / limit + 0.95);
		// 2. 현재 페이지에서 보여줄 시작 페이지 수(1, 11, 21페이지 등)
		int startPage = ((int)((double)page2 / 10 + 0.9) - 1) * 10 + 1;
		// 3. 현재 페이지에서 보여줄 마지막 페이지 번호(10, 20, 30 페이지 등)
		int endPage = startPage + 10 - 1;
		// 4. 마지막 페이지가 현재 페이지에서 표시할
		//	  최대페이지(전체 페이지) 수 보다 클 경우
		// 	  마지막 페이지 번호를 전체 페이지 번호로 대체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(page2, maxPage, startPage, endPage, listCount);
		System.out.println("Action 댓글리스트  action pageInfo");
		// 계산된 모든 페이지 정보를 PageInfo 객체에 저장

		// request 객체의 setAtribute() 메서드를 호출하여
		// 게시물 목록 정보(ArrayList)와 페이지 정보(PageInfo) 객체를 저장
		request.setAttribute("articleList2", articleList);
		request.setAttribute("pageInfo2", pageInfo);
		String json = "[";
		for(int i = 0; i< articleList.size(); i++) {
			int comment_num = articleList.get(i).getComment_num();
			board_type = articleList.get(i).getBoard_type();
			board_num = articleList.get(i).getBoard_num();
			String comment_id =articleList.get(i).getComment_id();
			String comment_desc = articleList.get(i).getComment_desc();
			int re_ref =  articleList.get(i).getRe_ref();
			int re_lev =  articleList.get(i).getRe_lev();
			int re_seq =   articleList.get(i).getRe_seq();
			Date date =   articleList.get(i).getDate();
			json += "{\"comment_num\":" + comment_num + ",";
			json += "\"board_type\":" + board_type + ",";
			json += "\"board_num\":" + board_num + ",";
			json += "\"comment_id\":\"" + comment_id + "\",";
			json += "\"comment_desc\":\"" + comment_desc + "\",";
			json += "\"re_ref\":" + re_ref + ",";
			json += "\"re_lev\":" + re_lev + ",";
			json += "\"re_seq\":" + re_seq + ",";
			json += "\"date\":\"" + date + "\"}";
			
			if (i != articleList.size() - 1) {
				json += ",";
			}
			
		}
		json += "]";
		PrintWriter out = response.getWriter();
		out.print(json);
		

//		forward = new ActionForward();
//		forward.setPath("BookDetail.bok?isbn="+book_isbn+"&page="+page);
//		forward.setRedirect(true);			
//		return forward;
		return null;
	}

}
