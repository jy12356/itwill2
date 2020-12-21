package action.mybasket;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Mybasket.MyBasketListService;
import vo.ActionForward;
import vo.BookBean;
import vo.MyBasketBean;
import vo.PageInfo;

public class MyBasketListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("MyBasketAction!");
//		System.out.println("isbn가져오니? : " + request.getParameter("isbn")); // 가져올필요가없지 암.
		ActionForward forward = null;

		// 아이디 세션가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("id : " +id);
		
		if (id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('로그인을 해주셔야합니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		} else {

			int page = 1;
			int limit = 10; 
			System.out.println("MyBasketAction 1");
			
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			System.out.println("MyBasketAction 2");
			System.out.println("mybasketListAction에서 가져온 page : " + page);

			MyBasketListService myBasketListService = new MyBasketListService();
			int listCount = myBasketListService.getListCount(id);
			System.out.println("mybasketListAction에서 listCount : " + listCount);
			
			String memState = myBasketListService.getMemState(id);
			
			System.out.println(memState);
			System.out.println("MyBasketAction 3");

			ArrayList<MyBasketBean> myBasketList = new ArrayList<MyBasketBean>();
			myBasketList = myBasketListService.getMyBasketList(page, limit, id);
			
			// 페이지 계산 작업 수행
			// 1. 전체 페이지 수 계산
			// (총 게시물 수 / 페이지 당 게시물 수 + 0.95) -> 정수로 변환
			int maxPage = (int) ((double) listCount / limit + 0.95);
			System.out.println("MyBasketAction 4");

			// 2. 현재 페이지에서 보여줄 시작 페이지 번호(1, 11, 21 페이지 등)
			int startPage = ((int) ((double) page / 10 + 0.9) - 1) * 10 + 1;

			// 3. 현재 페이지에서 보여줄 마지막 페이지 번호(10, 20, 30 페이지 등)
			int endPage = startPage + 10 - 1;

			// 4. 마지막 페이지가 현재 페이지에서 표시할
			// 최대 페이지(전체 페이지) 수 보다 클 경우
			// 마지막 페이지 번호를 전체 페이지 번호로 대체
//			if (endPage > maxPage) {
//				endPage = maxPage;
//			}
			PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
			System.out.println("MyBasketAction 5");
			request.setAttribute("memState", memState);
			request.setAttribute("myBasketList", myBasketList);
			System.out.println("myBasketList : " + myBasketList);
			System.out.println("MyBasketAction 6");
			
			
			request.setAttribute("pageInfo", pageInfo);
			System.out.println("MyBasketAction 7");


			forward = new ActionForward();
			forward.setPath("/myPage/my_basket.jsp");
//		forward.setRedirect(true);

		}
		return forward;
	}

}
