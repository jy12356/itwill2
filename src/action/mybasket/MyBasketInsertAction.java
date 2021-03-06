package action.mybasket;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Mybasket.MyBasketInsertService;
import vo.ActionForward;

public class MyBasketInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MyBasketInsertAction!");
		ActionForward forward =null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String isbn = request.getParameter("isbn");
		System.out.println("순서 1");
		if(id == null) {
			System.out.println("순서 2");

			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('로그인을 해주셔야합니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		}else {
			System.out.println("순서 3");

//			MyBasketInsertService myBaksetInsertService = new MyBasketInsertService();
			boolean isOverlap = MyBasketInsertService.checkOverlap(isbn,id);
			if(isOverlap == true) {
				System.out.println("순서 4");

				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('책바구니에 이미 존재하는 도서입니다.')"); // 다이얼로그 메세지 출력
				out.println("history.back()"); // 이전 페이지로 이동
				out.println("</script>"); // 자바스크립트 끝 태그
			}else {
				System.out.println("순서 5");

				MyBasketInsertService myBaksetInsertService = new MyBasketInsertService();

				boolean isInsertSuccess = myBaksetInsertService.insertBasket(isbn,id);
				
				if(!isInsertSuccess) {
					System.out.println("순서 6");

					response.setContentType("text/html; charset=UTF-8"); 
					PrintWriter out = response.getWriter();
					out.println("<script>"); // 자바스크립트 시작 태그
					out.println("alert('장바구니 등록을 실패하였습니다.')"); // 다이얼로그 메세지 출력
					out.println("history.back()"); // 이전 페이지로 이동
					out.println("</script>"); // 자바스크립트 끝 태그
				} else {
					System.out.println("순서 7");

					forward = new ActionForward();
					forward.setPath("MyBasketList.bk");
					forward.setRedirect(true);
				}
			}
			
		}
		System.out.println("순서 8");

		return forward;
	}

}
