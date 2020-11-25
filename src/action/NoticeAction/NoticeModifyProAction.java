package action.NoticeAction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeSvc.NoticeModifyProService;
import vo.ActionForward;
import vo.NoticeVo.NoticeActionForward;
import vo.NoticeVo.NoticeBean;

public class NoticeModifyProAction implements action.NoticeAction.NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeModifyProAction");
		
		NoticeActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeModifyProService noticeModifyProService = new NoticeModifyProService();
		boolean isRightUser = noticeModifyProService.isArticleWriter(num, request.getParameter("num"));
		
		System.out.println("isRightUser");
		
		if(!isRightUser) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			NoticeBean article = new NoticeBean();
			article.setNum(num);
			article.setId(request.getParameter("id"));
			article.setSubject(request.getParameter("subject"));
			article.setContent(request.getParameter("content"));
			article.setFile(request.getParameter("file"));
			Boolean isModifySuccess = noticeModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				response.setContentType("text/html : charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				forward = new NoticeActionForward();
				forward.setPath("NoticeDetail.not?num="+ num + "&page=" + request.getParameter("page"));
				forward.setRedirect(true);
			}
			
		}
		
		
		return forward;
	}

}
