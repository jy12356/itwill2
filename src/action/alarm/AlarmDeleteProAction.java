package action.alarm;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.alarm.AlarmDeleteProService;
import vo.ActionForward;

public class AlarmDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AlarmDeleteProAction");
		
		ActionForward forward = null;
		int num = Integer.parseInt(request.getParameter("num"));
		
		AlarmDeleteProService alarmDeleteProService = new AlarmDeleteProService();
		
		boolean isDeleteSuccess = 
				alarmDeleteProService.removeArticle(num);
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {r
			forward = new ActionForward();
			forward.setPath(
					"AlarmList.al?page=" + request.getParameter("page"));
			forward.setRedirect(true);
		}
		return forward;
	}

}