package action.rental;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.book.BookDibsDeleteService;
import svc.rental.RentalDeleteService;
import vo.ActionForward;

public class rentalDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("rentalDeleteAction");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		List<Integer> inerNumList = new ArrayList();
		
		String[] checkArr=request.getParameterValues("inter_num[]");
		
		for(int i = 0; i<checkArr.length; i++) {
			inerNumList.add(Integer.parseInt(checkArr[i]));
		}
				
		RentalDeleteService rentalDeleteService = new RentalDeleteService(); 
		boolean isDeleteSuccess =  rentalDeleteService.rentalDelete(inerNumList,id);

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
