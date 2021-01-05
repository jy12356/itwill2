package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.MemberModifyProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberModifyProAction");
		
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		System.out.println("MemberModifyProAction id : "+id);
		MemberModifyProService memberModifyProService = new MemberModifyProService();
		boolean isRightUser = memberModifyProService.isArticleWriter(id);
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		System.out.println(request.getParameter("password")+"/000/"+request.getParameter("password1"));
		
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
			article.setName(request.getParameter("name"));
			
			if(request.getParameter("password1")==null) {
				System.out.println("111"+request.getParameter("password")+"/000/"+request.getParameter("password1"));
				article.setPassword(request.getParameter("password"));
			} else {
				System.out.println("222"+request.getParameter("password")+"/000/"+request.getParameter("password1"));
				article.setPassword(request.getParameter("password1"));
			}
			
			article.setPhone(request.getParameter("phone"));
			article.setCatg(request.getParameter("catg"));
			article.setAddress(request.getParameter("sample4_postcode")+'/'+request.getParameter("sample4_roadAddress")+'/'+request.getParameter("sample4_detailAddress"));
			article.setAge(Integer.parseInt(request.getParameter("age")));
			article.setEmail(request.getParameter("email"));
			
			boolean isModifySuccess = 
					memberModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원수정이 실패했습니다!')");
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












