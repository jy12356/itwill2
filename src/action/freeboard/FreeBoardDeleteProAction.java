package action.freeboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.freeboard.FreeBoardDeleteProService;
import vo.ActionForward;
import vo.FreeBoardBean;

public class FreeBoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FreeBoardDeleteProAction!!");
		
		ActionForward forward = null;
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		System.out.println("FreeBoardDeleteProAction - 1");
		
		FreeBoardDeleteProService freeBoardDeleteProService = new FreeBoardDeleteProService();
		boolean isRightUser = 
				freeBoardDeleteProService.isArticleWriter(board_num, request.getParameter("id"));
		
		System.out.println("FreeBoardDeleteProAction - 2");
		
		if(!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			FreeBoardBean article = new FreeBoardBean();
			article.setBoard_num(board_num);
			boolean isDeleteSuccess = freeBoardDeleteProService.removeArticle(article);
			
			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
				
			} else {
				forward = new ActionForward();
				forward.setPath("FreeBoardList.free" + "&page=" + request.getParameter("page"));
				forward.setRedirect(true);
			}
			
			
			
			
		}
		
		
		
		return forward;
		
		
		
		
		
		
		
	}

}
