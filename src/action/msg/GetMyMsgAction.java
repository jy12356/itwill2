package action.msg;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.msg.MyMsgDetailService;
import svc.request.RequestDetailService;
import vo.ActionForward;
import vo.MsgBean;
import vo.RequestBean;

public class GetMyMsgAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestDetailAction");
		
		ActionForward forward = null;
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		String id = (String)session.getAttribute("id");
		MyMsgDetailService myMsgDetailService = new MyMsgDetailService();
		MsgBean msgBean = myMsgDetailService.getMsgDetail(num,id);
		if(msgBean != null) {
			boolean isRead = myMsgDetailService.updateIsRead(num);
			if(isRead) {
				request.setAttribute("msgBean", msgBean);
				forward = new ActionForward();
				forward.setPath("/myPage/myMsgDetail.jsp?num="+msgBean.getNum());
			}else {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('관리자에게 문의 바랍니다.')"); // 다이얼로그 메세지 출력
				out.println("history.back()"); // 이전 페이지로 이동
				out.println("</script>"); // 자바스크립트 끝 태그
			}
			
		}else {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('삭제된 메세지입니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		}
		
		return forward;
	}

}
