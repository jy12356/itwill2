package action.member;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.MemberWriteProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberWriteProAction!");
		System.out.println(request.getParameter("sample4_postcode")+" : 오류확인중...");
		
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
		memberBean.setAddress(request.getParameter("sample4_postcode")+'/'+request.getParameter("sample4_roadAddress")+'/'+request.getParameter("sample4_detailAddress"));
		memberBean.setName(request.getParameter("name"));
		
		System.out.println(request.getParameter("sample4_postcode"));
		System.out.println(request.getParameter("sample4_roadAddress"));
		System.out.println(request.getParameter("sample4_detailAddress"));


		
		
		MemberWriteProService memberWriteProService = new MemberWriteProService();
		boolean isWriteSuccess = memberWriteProService.registArticle(memberBean);
		
		
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); 
			out.println("alert('fail!')");
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

















