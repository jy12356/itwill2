package action.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.ReviewBean;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ReviewListAction!");
		
		ActionForward forward = null;
		
		// 리뷰 번호 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("게시물 번호 : " + num);
		
		// ReviewListService 클래스의 인스턴스 생성 후
		// getArticleList() 메서드를 호출하여 게시물 번호에 해당하는 글내용 가져오기
		// => 파라미터 : 글번호(num), 리턴타입 : 게시물 1개 정보(ReviewBean)
		ReviewListService reviewListService = new ReviewListService();
		ReviewBean article = reviewListService.getArticleList(num);
		
		// 글내용이 저장된 ReviewBean 객체를 request 객체에 저장
		request.setAttribute("article", article);
		
		// /sub1/detail.jsp 페이지로 포워딩
		// => request 객체를 유지하고, 서블릿 주소가 유지되어야 하므로
		//    Dispatcher 방식으로 포워딩
		forward = new ActionForward();
		forward.setPath("/sub1/detail.jsp");
//		forward.setRedirect(false); // 기본값 false 이므로 생략 가능
		
		return forward;
	}

}
