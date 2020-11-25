package action.NoticeAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.NoticeSvc.NoticeDetailService;
import vo.NoticeVo.NoticeActionForward;
import vo.NoticeVo.NoticeBean;

public class NoticeModifyFormAction implements action.NoticeAction.NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		NoticeActionForward forward = null;
		int num = Integer.parseInt(request.getParameter("num"));
		
		NoticeDetailService noticeDetailService = new NoticeDetailService();
		NoticeBean article = noticeDetailService.getArticle(num);
		
		request.setAttribute("article", article);
		
		forward = new NoticeActionForward();
		forward.setPath("/sub5/notice_board_Modify.jsp");
		
		
		return forward;
	}

}
