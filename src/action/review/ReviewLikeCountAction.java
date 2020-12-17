package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		
		String book_isbn = request.getParameter("isbn");
		String page=request.getParameter("page");
		System.out.println("책코드 : " + book_isbn);
		System.out.println("페이지번호 : " + page);
		
		String like_id = request.getParameter("like_id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		System.out.println(like_id);
		System.out.println(review_num);
		ReviewLikeCountService reviewLikeCountService = new ReviewLikeCountService();
		
		boolean isLikeWriter = reviewLikeCountService.isLikeWriter(like_id, review_num);

		int num = Integer.parseInt(request.getParameter("num"));

		JSONObject json = new JSONObject();
		if(isLikeWriter) {
//			out.print("이미 좋아요를 누르셨습니다.");
			json.put("text", "이미 좋아요를 누르셨습니다.");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json.toString());
		} else {
			// ----- 좋아요 등록 --------------------------------------------------------------
			LikeBean likeBean = new LikeBean();
			likeBean.setLike_id(request.getParameter("like_id")); // 좋아요 등록 ID
			likeBean.setBook_isbn(request.getParameter("book_isbn")); // 좋아요 1 등록
			likeBean.setReview_num(Integer.parseInt(request.getParameter("review_num"))); // 리뷰게시물번호
			
			boolean isLikeSuccess= reviewLikeCountService.ReviewLikeUp(likeBean,num);
			
			if(!isLikeSuccess) {
				// 좋아요 등록 실패시
				json.put("text", "좋아요 등록에 실패하였습니다. 다시시도 해주시길 바랍니다.");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print(json.toString());
			} else {
				// 좋아요 등록 성공시
				// ----- 좋아요 수 반영 -------------------------------------------------------
				System.out.println("리뷰번호 : " + num);
				ReviewBean rvb = reviewLikeCountService.getArticle(num);
				JSONArray jsonArray = new JSONArray(); 
				response.setContentType("text/html; charset=UTF-8");
				json.put("text", "좋아요 성공했습니다.");
				String likeCount = String.valueOf(rvb.getLikecount());
				json.put("likeCount", likeCount);
				jsonArray.add(json);
				PrintWriter out = response.getWriter();
				out.print(json);
				
			}
		}
			return null;
	}

}

