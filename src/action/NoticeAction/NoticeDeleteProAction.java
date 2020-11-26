package action.NoticeAction;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.NoticeSvc.NoticeDeleteProService;
import vo.NoticeVo.NoticeActionForward;

public class NoticeDeleteProAction implements NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeActionForward forward = null;
		System.out.println("NoticeDelteProAction");
		ServletContext context = request.getServletContext();
		String saveFolder = "/noticeUpload";
		String realFolder = context.getRealPath(saveFolder);
		int fileSize = 1024 * 1024 * 10; // 10MByte 크기 지정
		MultipartRequest multi = new MultipartRequest(
				request, 
				realFolder, 
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy() 
		);
		
		int num = Integer.parseInt(multi.getParameter("num"));
		String id = multi.getParameter("id");
		
		NoticeDeleteProService noticeDeleteProService = new NoticeDeleteProService();
		boolean isArticleNoticeWriter = noticeDeleteProService.isArticleNoticeWriter(num, id);
		
		System.out.println("isArticleNoticeWriter = " + isArticleNoticeWriter);
		
		if(!isArticleNoticeWriter) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			boolean isDeleteSuccess = 
					noticeDeleteProService.removeArticle(num);
			
			// 삭제 작업 요청 결과 판별
			if(!isDeleteSuccess) { // 삭제 실패 시
				// 자바스크립트를 활용하여 "삭제 실패!" 출력 후
				// 이전페이지로 이동
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else { // 삭제 성공 시
				// ActionForward 객체를 생성하여 "BoardList.bo" 서블릿 요청
		        // Redirect 방식으로 포워딩
				// => URL 뒤에 파라미터로 페이지번호(page)를 전달
				forward = new NoticeActionForward();
				forward.setPath(
						"NoticeBoardList.not?page=" + multi.getParameter("page"));
				forward.setRedirect(true);
			}
		}
		
		return forward;
	}

}
