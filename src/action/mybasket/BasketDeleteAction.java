package action.mybasket;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Mybasket.BasketDeleteService;
import vo.ActionForward;

public class BasketDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BasketDeleteAction!");
		
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<Integer> inerNumList = new ArrayList<Integer>();
		String[] checkArr=request.getParameterValues("inter_num[]");
		System.out.println(checkArr);
		for(int i = 0; i<checkArr.length; i++) {
			inerNumList.add(Integer.parseInt(checkArr[i]));
		}
				
		BasketDeleteService basketDeleteService = new BasketDeleteService(); 
		boolean isBookInterDel =  basketDeleteService.basketDelete(inerNumList,id);

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
