package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewWriteProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewWriteProAction!");
		
		ActionForward forward = null;
		
//		// 현재 컨텍스트(객체) 정보 가져오기 위해  request 객체의 getServletContext() 메서드를 호출
//		ServletContext context = request.getServletContext();
			
		ReviewBean reviewBean = new ReviewBean();
		
		// 12.06 
//		System.out.println("글쓴이 : " + request.getParameter("id")); 
//		System.out.println("글내용 : " + request.getParameter("content"));
//		System.out.println("별점 : " + Integer.parseInt(request.getParameter("starcount")));
//		System.out.println("페이지번호 : " + request.getParameter("isbn"));
//		System.out.println("스포 : " + Integer.parseInt(request.getParameter("spoiler")));
		 
		
		reviewBean.setId(request.getParameter("id"));
		reviewBean.setContent(request.getParameter("content"));
		reviewBean.setStarcount(Integer.parseInt(request.getParameter("starcount"))); 
		reviewBean.setIsbn(request.getParameter("isbn"));
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
			forward.setPath("BookDetail.bok");
			forward.setRedirect(true);			
		}
		return forward;
	}

}
