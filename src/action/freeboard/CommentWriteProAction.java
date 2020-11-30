package action.freeboard;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.freeboard.CommentWriteProService;
import vo.ActionForward;
import vo.CommentBean;

public class CommentWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("CommentWriteProAction!");
		
		
		ActionForward forward = null;
		System.out.println(" CommentWriteProAction - 페이지가져와?  " + Integer.parseInt(request.getParameter("page")));
		int page = Integer.parseInt(request.getParameter("page"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		System.out.println("board_type : " + Integer.parseInt(request.getParameter("board_type")));
		System.out.println("board_num : " + Integer.parseInt(request.getParameter("board_num")));
		System.out.println("comment_id : " + request.getParameter("comment_id"));
		System.out.println("comment_desc : " + request.getParameter("comment_desc"));
		
		CommentBean commentBean = new CommentBean();
		commentBean.setBoard_type(Integer.parseInt(request.getParameter("board_type")));
		commentBean.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		commentBean.setComment_id(request.getParameter("comment_id"));
		commentBean.setComment_desc(request.getParameter("comment_desc"));
		
//		if(request.getParameter("cmt_num")!=null) {
//			commentBean.setRe_ref(Integer.parseInt(request.getParameter("cmt_num")));			
//		}else {
//			commentBean.setRe_ref(0);		
//		}
		
		CommentWriteProService commentWriteProService = new CommentWriteProService();
		boolean isWriteSuccess = commentWriteProService.registComment(commentBean);
		
		if(!isWriteSuccess) {
			
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('댓글 등록 실패!')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
			
		} else {
			
			forward = new ActionForward();
			forward.setPath("FreeBoardDetail.free?board_num=" + board_num + 
									"&page=" + request.getParameter("page")+"&board_type="+board_type);
			
			// 3. 포워딩 방식(Redirect 방식) 지정
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
