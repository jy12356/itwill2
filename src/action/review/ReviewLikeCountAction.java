package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewLikeCountService;
import vo.ActionForward;
import vo.LikeBean;
import vo.ReviewBean;

public class ReviewLikeCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewLikeCountAction!");
		
		ActionForward forward = null;
		// ----- 중복체크 ---------------------------------------------------------------
		String like_id = request.getParameter("like_id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		
		ReviewLikeCountService reviewLikeCountService = new ReviewLikeCountService();
		
		boolean isLikeWriter = reviewLikeCountService.isLikeWriter(like_id, review_num);
		
		if(isLikeWriter) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('좋아요 클릭 중복!')");
			out.println("history.back()");
			out.println("</script>");	
		} else {
			// ----- 좋아요 등록 --------------------------------------------------------------
			LikeBean likeBean = new LikeBean();
			likeBean.setLike_id(request.getParameter("like_id")); // 좋아요 등록 ID
			likeBean.setBook_isbn(request.getParameter("book_isbn")); // 좋아요 1 등록
			likeBean.setReview_num(Integer.parseInt(request.getParameter("review_num"))); // 리뷰게시물번호
			
			boolean isLikeSuccess= reviewLikeCountService.ReviewLikeUp(likeBean);
			
			if(!isLikeSuccess) {
				// 좋아요 등록 실패시
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");// 자바스크립트 시작 태그
				out.println("alert('좋아요 등록 실패!')"); // 다이얼로그 메세지 출력
				out.println("history.back()"); // 이전 페이저로 이동
				out.println("</script>"); // 자바스크립트 끝 태그
			} else {
				// 좋아요 등록 성공시
				// ----- 좋아요 수 반영 -------------------------------------------------------
				int num = Integer.parseInt(request.getParameter("num"));
				System.out.println("리뷰번호 : " + num);
				
				ReviewBean article = reviewLikeCountService.getArticle(num);
				request.setAttribute("article", article);
				forward = new ActionForward();
				forward.setPath("BookDetail.bok");
				forward.setRedirect(true);
			}
		}
			return forward;
	}

}
