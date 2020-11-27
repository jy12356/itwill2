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
		// num값,
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String id = request.getParameter("id");
		System.out.println("FreeBoardDeleteProAction - 1");
		System.out.println("DeleteActionPro ID : "+id);
		FreeBoardDeleteProService freeBoardDeleteProService = new FreeBoardDeleteProService();
		boolean isRightUser = 
				freeBoardDeleteProService.isArticleWriter(board_num, id);
		
		System.out.println("FreeBoardDeleteProAction - 2");
		
		if(!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else { // 일치할경우
			// 삭제요청
			boolean isDeleteSuccess = freeBoardDeleteProService.removeArticle(board_num);
			
			if(!isDeleteSuccess) { // 삭제실패시
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
				
			} else { // 삭제 성공시
				forward = new ActionForward();
				forward.setPath("FreeBoardList.free?page=" + request.getParameter("page"));
				forward.setRedirect(true);
			}
			
			
			
			
		}
		
		
		
		return forward;
		
		
		
		
		
		
		
	}

}
