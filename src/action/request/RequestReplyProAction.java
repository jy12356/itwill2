package action.request;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.msg.MsgSpanService;
import svc.request.RequestReplyProService;
import vo.ActionForward;
import vo.MsgBean;
import vo.RequestBean;

public class RequestReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestReplyProAction!");
		
		ActionForward forward = null;
		
		RequestBean article = new RequestBean();
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setId(request.getParameter("id"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		article.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		article.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		RequestReplyProService requestReplyProService = new RequestReplyProService();
		boolean isReplySuccess = RequestReplyProService.replyArticle(article);
		System.out.println(article.toString());
		
		if(!isReplySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글 등록에 실패했어요')");
			out.println("history.back()");
			out.println("</script>");
		} else {		
				HttpSession session = request.getSession();
				MsgBean msgBean = new MsgBean();		
				String id =request.getParameter("id");
				String fromid = (String)session.getAttribute("id");
				String content = "신청하신 도서가 등록되었습니다. ";
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
					forward.setPath("RequestList.rq?page=" + request.getParameter("page"));
					forward.setRedirect(true);
				}
		}
		
		return forward;
	}

}
