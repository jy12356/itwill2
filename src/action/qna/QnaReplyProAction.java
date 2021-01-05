package action.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.alarm.AlarmListService;
import svc.msg.MsgSpanService;
import svc.qna.QnaReplyProService;
import vo.ActionForward;
import vo.MsgBean;
import vo.QnaBean;

public class QnaReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaReplyProAction - ActionForward" );
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		QnaBean article = new QnaBean();
		
		article.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		article.setId(request.getParameter("id"));
		System.out.println(request.getParameter("id"));
		article.setPass(request.getParameter("pass"));
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("content"));
		article.setContent2(request.getParameter("content2"));
		article.setQna_genre(request.getParameter("qna_genre"));
		article.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		article.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		article.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		QnaReplyProService qnaReplyProService = new QnaReplyProService();
		boolean isReplySuccess = qnaReplyProService.replyArticle(article);
		
		if(!isReplySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			AlarmListService alarmlistservice = new AlarmListService();
			int messageCount = alarmlistservice.listCount(id);
			System.out.println("messageCount" + messageCount);
			session.setAttribute("messageCount", messageCount);
			
			session = request.getSession();
			MsgBean msgBean = new MsgBean();		
			id =request.getParameter("id");
			String fromid = (String)session.getAttribute("id");
			String content = "답변이 등록되었습니다. ";
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
			}else{
				forward = new ActionForward();
				forward.setPath("QnaList.qna?page=" + request.getParameter("page"));
				forward.setRedirect(true);
				
			}
		}
		
		return forward;
	}

}
