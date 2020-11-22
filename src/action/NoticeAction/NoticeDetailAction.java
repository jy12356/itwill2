package action.NoticeAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeSvc.NoticeDetailService;
import vo.NoticeVo.NoticeActionForward;
import vo.NoticeVo.NoticeBean;

public class NoticeDetailAction implements NoticeAction{

	@Override
	public NoticeActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDetailAction");
		NoticeActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("공지 번호 : " + num);
		
		NoticeDetailService noticeDetailService = new NoticeDetailService();
		NoticeBean article = noticeDetailService.getArticle(num);
		
		request.setAttribute("article", article);
		
		forward = new NoticeActionForward();
		forward.setPath("/sub5/notice_view.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
