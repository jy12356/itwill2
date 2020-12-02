package action.freeboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.freeboard.CommentReplyService;
import vo.ActionForward;
import vo.CommentBean;

public class CommentReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("CommentReplyAction!");
		
		
		ActionForward forward = null;
		System.out.println("page : " + Integer.parseInt(request.getParameter("page")));
		System.out.println("comment_num : " + Integer.parseInt(request.getParameter("comment_num")));
		System.out.println("board_type : " + Integer.parseInt(request.getParameter("board_type")));
		System.out.println("board_num : " + Integer.parseInt(request.getParameter("board_num")));
		System.out.println("comment_id : " + request.getParameter("comment_id"));
		System.out.println("comment_desc : " + request.getParameter("comment_desc"));
		System.out.println("re_ref : " + Integer.parseInt(request.getParameter("re_ref")));
		System.out.println("re_lev : " + Integer.parseInt(request.getParameter("re_lev")));
		System.out.println("re_seq : " + Integer.parseInt(request.getParameter("re_seq")));
		int page = Integer.parseInt(request.getParameter("page"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		
		
		CommentBean cb = new CommentBean();
		cb.setComment_num(Integer.parseInt(request.getParameter("comment_num")));
		cb.setBoard_type(Integer.parseInt(request.getParameter("board_type")));
		cb.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		cb.setComment_id(request.getParameter("comment_id"));
		cb.setComment_desc(request.getParameter("comment_desc"));
		cb.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		cb.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		cb.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		CommentReplyService commentReplyService = new CommentReplyService();
		boolean isReplySuccess = CommentReplyService.replyComment(cb);
		
		if(!isReplySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('대댓글 등록 실패!')");
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
