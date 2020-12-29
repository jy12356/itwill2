package action.msg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.book.BookListService;
import svc.book.MainListService;
import svc.msg.MsgListService;
import vo.ActionForward;
import vo.BookBean;
import vo.MsgBean;
import vo.PageInfo;

public class MyMsgListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyMsgListAction");
		ActionForward forward = null;
		
		int page = 1;//현재 페이지 번호 저장할 변수
		int limit = 10; //페이지당 표시할 게시물 수를 결정하는 변수
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}
		HttpSession session =request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		MsgListService msgListService = new MsgListService();
		int listCount = msgListService.myMsgListCount(id);
		System.out.println("전체 메세지 수 : " + listCount);
		
		ArrayList<MsgBean> msgList = new ArrayList<MsgBean>();
		msgList = msgListService.myMsgList(page,limit,id);
		int maxPage = (int)((double)listCount/ limit+0.95);
		int startPage = ((int)((double)page/10+0.9)-1)*10+1;
		int endPage=startPage+10-1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		request.setAttribute("msgList", msgList);
		request.setAttribute("pageInfo", pageInfo);
		
		
		forward = new ActionForward();
		forward.setPath("/myPage/myMsg.jsp");
		System.out.println("MyMsgListAction 끝");
		return forward;
		
	}


}
