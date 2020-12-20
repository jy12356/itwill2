package action.msg;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.msg.MsgSpanService;
import vo.ActionForward;
import vo.MsgBean;

public class MsgSpanAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MsgSpanAction!");
		ActionForward forward =null;
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MsgBean msgBean = new MsgBean();		
		String id =request.getParameter("id");
		String fromid =(String)session.getAttribute("id");
		String content = request.getParameter("content");
		msgBean.setId(id);
		msgBean.setContent(content);
		msgBean.setFromId(fromid);
		MsgSpanService msgSpanService = new MsgSpanService();
		boolean isSpan = msgSpanService.msgSpan(msgBean);
		if(!isSpan) {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('메세지를 보냈습니다.')"); // 다이얼로그 메세지 출력
			forward.setPath("/myPage/myMsg.jsp");
			forward = new ActionForward();		
		}else{
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('메세지 보내기 실패하였습니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		}
		return forward;
	}

}
