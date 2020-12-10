package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewLikeCountService;
import vo.ActionForward;
import vo.LikeBean;

public class ReviewLikeCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewLikeCountAction!");
		
		ActionForward forward = null;
		
		LikeBean likeBean = new LikeBean();
		
		likeBean.setLike_id(request.getParameter("like_id")); // 좋아요 등록 ID
		likeBean.setLike_check(1); // 좋아요 1 등록
		likeBean.setReview_num(Integer.parseInt(request.getParameter("review_num"))); // 리뷰게시물번호
		
		// ----- 중복확인 ---------------------------------------------------------------
		
		// ----- 좋아요 등록 --------------------------------------------------------------
		ReviewLikeCountService reviewLikeCountService = new ReviewLikeCountService();
		boolean isLikeSuccess= reviewLikeCountService.ReviewLikeUp(likeBean);
		
		// ----- 좋아요 수 반영 ------------------------------------------------------------
		
		
		if(!isLikeSuccess) {
			// 좋아요 등록 실패시
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('좋아요 등록 실패!')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이저로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		} else {
			// 좋아요 등록 성공시
//			int likeCount = reviewLikeCountService.ReviewLikeCount();
			
;			forward = new ActionForward();
			forward.setPath("BookDetail.re");
			forward.setRedirect(true);
		}
			return forward;
	}

}
