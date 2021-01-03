package action.member;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.MemListDeleteService;
import vo.ActionForward;

public class MemListDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemListDeleteAction");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<Integer> inerNumList = new ArrayList();
		String[] checkArr=request.getParameterValues("inter_num[]");
		for(int i = 0; i<checkArr.length; i++) {
			inerNumList.add(Integer.parseInt(checkArr[i]));
		}
				
		MemListDeleteService memListDeleteService = new MemListDeleteService(); 
		boolean isBookInterDel =  memListDeleteService.dibsDelete(inerNumList,id);

		if(!isBookInterDel) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제하였습니다.')");
			out.println("</script>");
		}
		
		return null;
	}


}
