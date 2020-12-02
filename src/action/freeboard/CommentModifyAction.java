package action.freeboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.freeboard.CommentModifyService;
import vo.ActionForward;
import vo.CommentBean;

public class CommentModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommentModifyAction - start");
		
		ActionForward forward = null;
		
		int page = Integer.parseInt(request.getParameter("page"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
//		System.out.println("가져오나? " + comment_num + " , " +  board_type);
		// 가져옴
//		System.out.println(request.getParameter("comment_desc"));
		CommentModifyService commentModifyService = new CommentModifyService();
		
//		boolean isRightUser 세션으로 확인하니까 필요없을듯.
		
		CommentBean cb = new CommentBean();
		cb.setComment_num(comment_num);
		cb.setBoard_type(board_type);
		cb.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		cb.setComment_id(request.getParameter("comment_id"));
		cb.setComment_desc(request.getParameter("comment_desc"));
		cb.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		cb.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		cb.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		boolean isModifySuccess = 
				commentModifyService.modifyComment(cb);
		
		System.out.println("CommentModifyAction - mid");
		
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("FreeBoardDetail.free?board_num="+board_num+ 
					"&page="+page+"&board_type="+board_type);
//			forward.setPath("FreeBoardDetail.free?board_num=" + board_num + 
//					"&page=" + request.getParameter("page")+"&board_type="+board_type);
			forward.setRedirect(true);
		}
		
		
		
		
		
		return forward;
	}

}
