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
		System.out.println("MemberCheckAction 아이디 가져오라그! "+id);
		MemberCheckService memberCheckService = new MemberCheckService();
		boolean isIdCheckSuccess = memberCheckService.registArticle(id);
		System.out.println(isIdCheckSuccess);
		/*
		 * if(!isIdCheckSuccess) {
		 * 
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter(); out.println("<script>"); // 자바스크립트 시작 태그
		 * out.println("alert('로그인에 실패하였습니다.')"); // 다이얼로그 메세지 출력
		 * out.println("history.back()"); // 이전 페이지로 이동 out.println("</script>"); //
		 * 자바스크립트 끝 태그
		 * 
		 * } else { HttpSession session = request.getSession();
		 * session.setAttribute("id", id); forward = new ActionForward();
		 * forward.setPath("MemberModifyForm.me"); forward.setRedirect(false); }
		 */

		return forward;
	}

}
