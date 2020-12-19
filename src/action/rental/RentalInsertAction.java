package action.rental;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.rental.RentalInsertService;
import vo.ActionForward;

public class RentalInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalInsertAction!");

		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<Integer> rentalAddList = new ArrayList();
		String[] checkArr=request.getParameterValues("inter_num[]");
		for(int i = 0; i<checkArr.length; i++) {
			rentalAddList.add(Integer.parseInt(checkArr[i]));
		}
		RentalInsertService rentalInsertService = new RentalInsertService();
		boolean isInsertSuccess = rentalInsertService.insertRental(rentalAddList,id);
			
		if(!isInsertSuccess) {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('책대여를 실패하였습니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('책대여에 성공하였습니다.')");
			out.println("</script>");
		}
		
		return null;
	}

}
