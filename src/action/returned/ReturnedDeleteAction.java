package action.returned;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.rental.RentalDeleteService;
import svc.rental.ReturnDeleteProService;
import svc.returned.ReturnedDeleteProService;
import vo.ActionForward;
import vo.ReturnedBean;

public class ReturnedDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReturnedDeleteAction");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		List<Integer> inerNumList = new ArrayList();
		
		String[] checkArr=request.getParameterValues("inter_num[]");
		
		for(int i = 0; i<checkArr.length; i++) {
			inerNumList.add(Integer.parseInt(checkArr[i]));
		}
				
		ReturnedDeleteProService returnedDeleteProService = new ReturnedDeleteProService();
		boolean isDeleteSuccess = returnedDeleteProService.removeArticle(inerNumList,id);
		
		if(!isDeleteSuccess) {
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
