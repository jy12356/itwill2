package action;

import java.io.IOException;
import java.rmi.Remote;
import java.rmi.server.RemoteCall;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Dispatch;

import sun.rmi.server.Dispatcher;
import svc.MemberListService;
import vo.ActionForward;
import vo.MemberBean;
import vo.PageInfo;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("MemberListAction");
		
		ActionForward forward = null;
		
		int page = 1; 
		int limit = 10;
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		MemberListService memberListService = new MemberListService();
		int listCount = memberListService.getListCount();
		ArrayList<MemberBean> articleList = new ArrayList<MemberBean>();
		articleList = MemberListService.getArticleList(page, limit);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		
		int startPage = ((int)((double)page / 10 + 0.9 ) - 1) * 10 + 1;
		
		int endPage = startPage + 10 - 1;
		
		if(endPage > maxPage ) {
			endPage = maxPage;
		 }
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		request.setAttribute("articleList", articleList);
		request.setAttribute("pageInfo", pageInfo);
		
		forward = new ActionForward();
		forward.setPath("/sub1/memberList.jsp");
		
		return forward;
	}

}
