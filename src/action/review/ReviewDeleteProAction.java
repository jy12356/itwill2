package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewDeleteProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewDeleteProAction!");
		
		ActionForward forward = null;
		
		// 게시물 삭제에 필요한 글번호(board_num) 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		System.out.println("글번호 :" + num);
		System.out.println("작성자 :" + id);
		
		ReviewDeleteProService reviewDeleteProService = new ReviewDeleteProService();
		
		boolean isReviewWriter = reviewDeleteProService.isReviewWriter(num, id);
		
		// 작성자 일치 판별
		if(!isReviewWriter) { // 아이디가 틀릴 경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");			
		} else { // 아이디가 일치 할 경우
			boolean isDeleteSuccess = ReviewDeleteProService.removeArticle(num);
			// 삭제 작업 요청 결과 판별
			if(!isDeleteSuccess) { // 삭제 실패 시
				// 자바스크립트를 활용하여 "삭제 실패!" 출력 후
				// 이전페이지로 이동
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패!')");
				out.println("history.back()");
			} else { // 삭제 성공 시
				forward = new ActionForward();
				forward.setPath("/BookDetail.re");
			}
		}
		
		return forward;
	}
}
