package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberModifyProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberModifyProAction");
		
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		
		MemberModifyProService memberModifyProService = new MemberModifyProService();
		boolean isRightUser = memberModifyProService.isArticleWriter(id, request.getParameter("password"));
		
		if(!isRightUser) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			MemberBean article = new MemberBean();
			article.setId(id);
			article.setName(request.getParameter("name"));
			article.setPassword(request.getParameter("password"));
			article.setPhone(request.getParameter("phone"));
			article.setCatg(request.getParameter("catg"));
			article.setAddress(request.getParameter("address"));
			article.setAge(Integer.parseInt(request.getParameter("age")));
			article.setEmail(request.getParameter("email"));
			
			boolean isModifySuccess = 
					memberModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패!')");
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












