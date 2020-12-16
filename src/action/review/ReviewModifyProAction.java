package action.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.review.ReviewModifyService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Action - ReviewModifyProAction");
		
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		
		ReviewModifyService reviewModifyService = new ReviewModifyService();
		
		boolean isReviewWriter = ReviewModifyService.isReviewWriter(num, id);
		
		if(!isReviewWriter) { 
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정권한이 없습니다.')");
			out.println("history.back()");
			out.println("</script>");			
		} else { 
			ReviewBean article = new ReviewBean();
			article.setNum(num);
			article.setId(request.getParameter("id"));
			article.setContent(request.getParameter("content"));
			article.setSpoiler(Integer.parseInt(request.getParameter("spoiler")));
			
			boolean isModifySuccess = reviewModifyService.modifyArticle(article);
			
			if(!isModifySuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("BookDetail.bok");
				forward.setRedirect(true);
			}
		}	
		return forward;
	}
}
