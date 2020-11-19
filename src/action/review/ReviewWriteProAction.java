package action.review;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewWriteProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookReWriteProAction!");
		
		ActionForward forward = null;
		
		// 현재 컨텍스트(객체) 정보 가져오기 위해  request 객체의 getServletContext() 메서드를 호출
		ServletContext context = request.getServletContext();
		
		ReviewBean reviewBean = new ReviewBean();
		
		reviewBean.setId("임시");
		reviewBean.setContent(request.getParameter("content"));
		reviewBean.setSpoiler(Integer.parseInt(request.getParameter("spoiler")));
		
		System.out.println("리뷰내용 :" + reviewBean.getContent());
		
		ReviewWriteProService reviewWriteProService = new ReviewWriteProService();
		boolean isWriteSuccess = reviewWriteProService.registArticle(reviewBean);

		if(!isWriteSuccess) {
			// 리뷰 등록 실패시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('글 등록 실패!')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이저로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
			
		} else {
			// 리뷰 등록 성공시
			forward = new ActionForward();
			forward.setPath("BookDetail.re");
			forward.setRedirect(false);			
		}
		return forward;
	}

}
