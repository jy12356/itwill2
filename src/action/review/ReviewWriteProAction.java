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
			
		ReviewBean reviewBean = new ReviewBean();	 

		String book_isbn = request.getParameter("isbn");
		String page=request.getParameter("page");
		int startcount = 0;
		System.out.println("책코드 : " + book_isbn);
		System.out.println("페이지번호 : " + page);
		reviewBean.setId(request.getParameter("id"));
		reviewBean.setContent(request.getParameter("content"));
		if(request.getParameter("starcount") !=null){
			reviewBean.setStarcount(Integer.parseInt(request.getParameter("starcount"))); 		    
		}else {
			reviewBean.setStarcount(startcount); 			
		}		
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
			forward.setPath("BookDetail.bok?isbn="+book_isbn);
			forward.setRedirect(true);			
		}
		return forward;
	}

}
