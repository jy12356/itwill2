package action.review;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		Timestamp date=new Timestamp(System.currentTimeMillis());
		
		CommentBean commentBean = new CommentBean();
		
		commentBean.setBoard_type(Integer.parseInt(request.getParameter("board_type"))); // 리뷰게시판
		commentBean.setBoard_num(Integer.parseInt(request.getParameter("board_num"))); // 리뷰게시번호
		commentBean.setComment_id(request.getParameter("comment_id")); // 댓글ID
		commentBean.setComment_desc(request.getParameter("comment_desc")); // 댓글내용
		
		System.out.println("댓글내용 :" + commentBean.getComment_desc());
		System.out.println("작성자 :" + commentBean.getComment_id());
		
		ReCommentWriteProService reCommentWriteProService = new ReCommentWriteProService();
		boolean isWriteSuccess = reCommentWriteProService.registArticle(commentBean);
		
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray(); 
		if(!isWriteSuccess) {
			// 리뷰 등록 실패시
			json.put("text", "댓글등록 실패!");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
//			out.println("<script>"); // 자바스크립트 시작 태그
//			out.println("alert('댓글등록 실패!')"); // 다이얼로그 메세지 출력
//			out.println("history.back()"); // 이전 페이저로 이동
//			out.println("</script>"); // 자바스크립트 끝 태그
			out.print(json.toString());	
		} else {
			// 리뷰 등록 성공시
			response.setContentType("text/html; charset=UTF-8");
			json.put("text", "댓글을 등록하였습니다");
			jsonArray.add(json);
			PrintWriter out = response.getWriter();
			out.print(json);
//			forward = new ActionForward();
//			forward.setPath("BookDetail.bok?isbn="+book_isbn+"&page="+page);
//			forward.setRedirect(true);			
		}
		return null;

	}

}
