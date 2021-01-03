package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import svc.review.ReCommentDeleteProService;
import svc.review.ReviewDeleteProService;
import vo.ActionForward;

public class ReCommentDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReCommentDeleteProAction!");
		
		ActionForward forward = null;
		
		String book_isbn = request.getParameter("isbn");
		String page=request.getParameter("page");
		System.out.println("책코드 : " + book_isbn);
		System.out.println("페이지번호 : " + page);
		
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		String comment_id = request.getParameter("id");
		
		System.out.println("리뷰번호 :" + comment_num);
		System.out.println("리뷰번호 :" + board_num);
		System.out.println("댓글보드번호 :" + board_type);
		System.out.println("작성자 :" + comment_id);
		
		ReCommentDeleteProService reCommentDeleteProService = new ReCommentDeleteProService();
		boolean isCommentWriter = reCommentDeleteProService.isCommentWriter(comment_num, board_num, board_type, comment_id);

		JSONObject json = new JSONObject();
		// 작성자 일치 판별
		if(!isCommentWriter) { // 아이디가 틀릴 경우
			json.put("text", "삭제권한이 없습니다!");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('삭제 권한이 없습니다!')");
//			out.println("history.back()");
//			out.println("</script>");
			out.print(json.toString());
		} else { // 아이디가 일치 할 경우
			boolean isDeleteSuccess = ReCommentDeleteProService.removeComment(comment_num);
			// 삭제 작업 요청 결과 판별
			if(!isDeleteSuccess) { // 삭제 실패 시
				// 자바스크립트를 활용하여 "삭제 실패!" 출력 후
				// 이전페이지로 이동
				json.put("text", "댓글삭제 실패!");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('삭제 실패!')");
//				out.println("history.back()");
				out.print(json);
			} else {
				json.put("text", "댓글을 삭제하였습니다");
				PrintWriter out = response.getWriter();
				out.print(json);
//				forward = new ActionForward();
//				forward.setPath("BookDetail.bok?isbn="+book_isbn);
//				forward.setRedirect(true);
			}
		}
		return null;
		
	}

}
