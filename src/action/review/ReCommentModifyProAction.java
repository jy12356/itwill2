package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReCommentDeleteProService;
import svc.review.ReCommentModifyService;
import vo.ActionForward;
import vo.CommentBean;

public class ReCommentModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Action - ReCommentModifyProAction");
		
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
		
		ReCommentModifyService reCommentModifyService = new ReCommentModifyService();
		
		boolean isCommentWriter = reCommentModifyService.isCommentWriter(comment_num, board_num, board_type, comment_id);
		
		// 작성자 일치 판별
		if(!isCommentWriter) { // 아이디가 틀릴 경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 아이디가 일치 할 경우
			CommentBean commentBean = new CommentBean();
			
			commentBean.setComment_num(Integer.parseInt(request.getParameter("comment_num"))); // 리뷰게시판
//			commentBean.setBoard_type(Integer.parseInt(request.getParameter("board_type"))); // 리뷰게시판
//			commentBean.setBoard_num(Integer.parseInt(request.getParameter("board_num"))); // 리뷰게시번호
//			commentBean.setComment_id(request.getParameter("comment_id")); // 댓글ID
			commentBean.setComment_desc(request.getParameter("comment_desc")); // 댓글내용
			
			System.out.println("댓글번호 :" + commentBean.getComment_num());
			System.out.println("댓글내용 :" + commentBean.getComment_desc());
//			System.out.println("작성자 :" + commentBean.getComment_id());
			
			boolean isModifySuccess = reCommentModifyService.modifyComment(commentBean);
			
			// 수정 작업 요청 결과 판별
			if(!isModifySuccess) { // 수정 실패 시
				// 자바스크립트를 활용하여 "수정 실패!" 출력 후
				// 이전페이지로 이동
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패!')");
				out.println("history.back()");
			} else {
				forward = new ActionForward();
				forward.setPath("BookDetail.bok?isbn="+book_isbn+"&page="+page);
				forward.setRedirect(true);
			}
		}
		return forward;
	}

}
