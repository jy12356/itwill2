package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReCommentWriteProService;
import vo.ActionForward;
import vo.CommentBean;

public class ReCommentWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReCommentWriteProAction!");
		
		ActionForward forward = null;
		
		String book_isbn = request.getParameter("isbn");
		String page=request.getParameter("page");
		System.out.println("책코드 : " + book_isbn);
		System.out.println("페이지번호 : " + page);
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setBoard_type(Integer.parseInt(request.getParameter("board_type"))); // 리뷰게시판
		commentBean.setBoard_num(Integer.parseInt(request.getParameter("board_num"))); // 리뷰게시번호
		commentBean.setComment_id(request.getParameter("comment_id")); // 댓글ID
		commentBean.setComment_desc(request.getParameter("comment_desc")); // 댓글내용
		
		System.out.println("댓글내용 :" + commentBean.getComment_desc());
		
		ReCommentWriteProService reCommentWriteProService = new ReCommentWriteProService();
		boolean isWriteSuccess = reCommentWriteProService.registArticle(commentBean);
		
		if(!isWriteSuccess) {
			// 리뷰 등록 실패시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('댓글등록 실패!')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이저로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
			
		} else {
			// 리뷰 등록 성공시
			forward = new ActionForward();
			forward.setPath("BookDetail.bok?isbn="+book_isbn+"&page="+page);
			forward.setRedirect(true);			
		}
		return forward;

	}

}
