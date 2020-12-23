package action.msg;

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
		
		request.setAttribute("msgBean", msgBean);

		
		forward = new ActionForward();
		forward.setPath("/myPage/myMsgDetail.jsp?num="+msgBean.getNum());
		
		return forward;
	}

}
