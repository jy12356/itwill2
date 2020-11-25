package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.CommentBean;

public class CommentWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("CommentWriteProAction!");
		
		ActionForward forward = null;
		
		CommentBean commentBean = new CommentBean();
		commentBean.setComment_num(comment_num);
		commentBean.setBoard_type(board_type);
		commentBean.setBoard_num(board_num);
		commentBean.setComment_id(comment_id);
		commentBean.setComment_content(comment_content);
		commentBean.setComment_date(comment_date);
		commentBean.setRe_ref(re_ref);
		commentBean.setRe_leb(re_leb);
		
		
		
		return forward;
	}

}
