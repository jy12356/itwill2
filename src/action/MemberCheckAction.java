package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberCheckService;
import vo.ActionForward;

public class MemberCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberCheckAction!");

		ActionForward forward = null;
		String id = request.getParameter("id");
		System.out.println("MemberCheckAction id : "+id);
		MemberCheckService memberCheckService = new MemberCheckService();
//		String data = null; 
		boolean isIdCheckSuccess = memberCheckService.registArticle(id);
		System.out.println(isIdCheckSuccess);

//		if (!isIdCheckSuccess) {
//			// "아이디중복"
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>"); // 자바스크립트 시작 태그
//			out.println("아이디 중복");
//			out.println("</script>"); // 자바스크립트 끝 태그
//		} else {
//			// "아이디 사용가능"
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>"); // 자바스크립트 시작 태그
//			out.println("아이디 사용가능");
//			out.println("</script>"); // 자바스크립트 끝 태그
//		}
		
		forward = new ActionForward();
		forward.setRedirect(false);
		return forward;
	}

}
