package action.msg;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.book.BookDibsDeleteService;
import svc.msg.MsgDeleteService;
import svc.msg.MsgSpanService;
import vo.ActionForward;
import vo.MsgBean;

public class MsgDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookDibsDeleteAction");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<Integer> msgNumList = new ArrayList();
		String[] checkArr=request.getParameterValues("msgNum[]");
		for(int i = 0; i<checkArr.length; i++) {
			msgNumList.add(Integer.parseInt(checkArr[i]));
		}				
		MsgDeleteService msgDeleteService = new MsgDeleteService(); 
		boolean isMsgDel =  msgDeleteService.msgDelete(msgNumList,id);

		if(!isMsgDel) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("실패");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("성공");
		}
		return null;
	}

}
