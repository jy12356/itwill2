package action.freeboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;
import vo.CommentBean;

public class CommentReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("CommentReplyProAction!");
		
		
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
		
		
		
		
		return null;
	}

}
