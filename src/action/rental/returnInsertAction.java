package action.rental;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Mybasket.MyBasketInsertService;
import svc.msg.MsgSpanService;
import svc.qna.QnaDeleteProService;
import svc.rental.RentalInsertService;
import svc.rental.ReturnDeleteProService;
import svc.rental.ReturnInsertService;
import vo.ActionForward;
import vo.MsgBean;
import vo.RentalBean;

public class returnInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("returnInsertAction!");
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		ReturnDeleteProService returnDeleteProService = new ReturnDeleteProService();
		boolean isDeleteSuccess = returnDeleteProService.removeArticle(num);
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구매 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			HttpSession session = request.getSession();
			MsgBean msgBean = new MsgBean();		
			String id =request.getParameter("id");
			String fromid = (String)session.getAttribute("id");
			String content = "반납이 완료되었습니다.";
			msgBean.setId(id);
			msgBean.setFromId(fromid);
			msgBean.setContent(content);
			MsgSpanService msgSpanService = new MsgSpanService();
			boolean isSpan = msgSpanService.msgSpan(msgBean);
			if(!isSpan) {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('메세지 보내기 실패하였습니다.')"); // 다이얼로그 메세지 출력
				out.println("history.back()"); // 이전 페이지로 이동
				out.println("</script>"); // 자바스크립트 끝 태그
			}else {
				forward = new ActionForward();
				forward.setPath("Return.rn");
				forward.setRedirect(true);
			}
		}
		return forward;
		
	}

}
