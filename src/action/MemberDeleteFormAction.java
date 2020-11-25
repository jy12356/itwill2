package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberDeleteProService;
import svc.MemberWriteProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberDeleteFormAction implements Action {

	@Override

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberDeleteFormAction!");

		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		
		MemberBean memberBean = new MemberBean();
		memberBean.setId(request.getParameter("id"));
		memberBean.setNum(Integer.parseInt(request.getParameter("num")));
		memberBean.setPassword(request.getParameter("password"));
		memberBean.setEmail(request.getParameter("email"));
		memberBean.setPhone(request.getParameter("phone"));
		memberBean.setCatg(request.getParameter("catg"));
		memberBean.setAge(Integer.parseInt(request.getParameter("age")));
		memberBean.setAddress(request.getParameter("address"));
		memberBean.setName(request.getParameter("name"));
		
		MemberDeleteProService memberDeleteProService = new MemberDeleteProService();
		boolean isWriteSuccess = memberDeleteProService.registArticle(memberBean);
		
		
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('회원가입에 실패하였습니다.!')");
			out.println("history.back()");
			out.println("</script>"); 
		} else {
			forward = new ActionForward();
			forward.setPath("MemberList.bo");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
