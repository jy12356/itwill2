package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberDeleteProService;
import svc.MemberModifyProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteProAction");
		
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		System.out.println("MemberModifyProAction id : "+id);
		MemberDeleteProService memberDeleteProService = new MemberDeleteProService();
		boolean isRightUser = memberDeleteProService.isArticleWriter(id);
		
		if(!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 일치하지 않습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			MemberBean article = new MemberBean();
			article.setId(id);
			boolean isDeleteSuccess = 
					memberDeleteProService.delelteArticle(article);
			
			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원삭제가 실패했습니다!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("Main.book");
				forward.setRedirect(true);
			}
			
		}
		
		
		return forward;
	}

}
