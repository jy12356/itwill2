package action.freeboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.freeboard.CommentDeleteService;
import svc.freeboard.FreeBoardDetailService;
import vo.ActionForward;
import vo.FreeBoardBean;

public class CommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommentDeleteAction!!");

		ActionForward forward = null;
		int page = Integer.parseInt(request.getParameter("page"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		
		System.out.println(comment_num + ", " + board_num + ", " + board_type);
		
		CommentDeleteService commentDeleteService = new CommentDeleteService();
		
//		boolean isRightUser = 세션에서검사해서 할필요없음.
		
		boolean isDeleteSuccess = commentDeleteService.removeComment(comment_num, board_num, board_type);
//		FreeBoardDetailService boardDetailService = new FreeBoardDetailService();
//		FreeBoardBean article = boardDetailService.getArticle(board_num);
//		System.out.println("댓글삭제성공후");
//		
//		request.setAttribute("article", article);
//		System.out.println("4");
		
		if(!isDeleteSuccess) { 
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
			
		} else { // 삭제 성공시
			System.out.println("삭제성공시 넘기기");
			forward = new ActionForward();
			forward.setPath("FreeBoardDetail.free?board_num="+board_num+ 
					"&page="+page+"&board_type="+board_type);
			forward.setRedirect(true);
		}
		
		
		
		
		return forward;
	}

}
