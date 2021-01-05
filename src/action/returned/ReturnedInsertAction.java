package action.returned;


import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.alarm.AlarmListService;
import svc.msg.MsgSpanService;
import svc.rental.ReturnDeleteProService;
import svc.returned.ReturnedInsertService;
import vo.ActionForward;
import vo.MsgBean;
import vo.ReturnedBean;

public class ReturnedInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReturnedInsertAction!!");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = null;
		String s_date = (String)request.getParameter("s_date");
		String onrental_date = (String)request.getParameter("onrental_date");
		String e_date = (String)request.getParameter("e_date");
		
		ReturnedBean returnedBean = new ReturnedBean();
		returnedBean.setNum(Integer.parseInt(request.getParameter("num")));
		returnedBean.setIsbn(request.getParameter("isbn"));
		returnedBean.setId(request.getParameter("id"));
		returnedBean.setState(request.getParameter("state"));
		returnedBean.setS_date(s_date);
		returnedBean.setOnrental_date(onrental_date);
		returnedBean.setE_date(e_date);
		returnedBean.setTitle(request.getParameter("title"));
		
		ReturnedInsertService returnedInsertService = new ReturnedInsertService();
		boolean isWriteSuccess = returnedInsertService.registArticle(returnedBean);
		
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('반납 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			int num = Integer.parseInt(request.getParameter("num"));
			ReturnDeleteProService returnDeleteProService = new ReturnDeleteProService();
			boolean isDeleteSuccess = returnDeleteProService.removeArticle(num);
			if(!isDeleteSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('반납 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				AlarmListService alarmlistservice = new AlarmListService();
				int messageCount = alarmlistservice.listCount(id);
				System.out.println("messageCount" + messageCount);
				session.setAttribute("messageCount", messageCount);
				
				session = request.getSession();
				MsgBean msgBean = new MsgBean();		
				id =request.getParameter("id");
				String fromid = (String)session.getAttribute("id");
				String content = "반납이 완료되었습니다.";
				msgBean.setId(id);
				msgBean.setFromId(fromid);
				msgBean.setContent(content);
				MsgSpanService msgSpanService = new MsgSpanService();
				boolean isSpan = msgSpanService.msgSpan(msgBean);
				System.out.println("MsgSpanService - msgSpan()3");
				if(!isSpan) {
					response.setContentType("text/html; charset=UTF-8"); 
					PrintWriter out = response.getWriter();
					out.println("<script>"); // 자바스크립트 시작 태그
					out.println("alert('메세지 보내기 실패하였습니다.')"); // 다이얼로그 메세지 출력
					out.println("history.back()"); // 이전 페이지로 이동
					out.println("</script>"); // 자바스크립트 끝 태그
					}else {
						forward = new ActionForward();
						returnedBean.setNum(num);
						forward.setPath("Return.rn");
						forward.setRedirect(true);
			}

		}
		}
		return forward;
	}
}	
