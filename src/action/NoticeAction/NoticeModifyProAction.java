package action.NoticeAction;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.NoticeSvc.NoticeModifyProService;
import vo.NoticeActionForward;
import vo.NoticeBean;

public class NoticeModifyProAction implements action.NoticeAction.NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeModifyProAction");
		
		NoticeActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		
		String saveFolder = "/noticeUpload";
		
		String realFolder = context.getRealPath(saveFolder);
		System.out.println("실제 업로드 폴더 : " + realFolder);
		
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
		String page = multi.getParameter("page");
		NoticeModifyProService noticeModifyProService = new NoticeModifyProService();
		boolean isRightUser = noticeModifyProService.isArticleWriter(num, id);
		System.out.println("isRightUser");
		
		if(!isRightUser) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			NoticeBean article = new NoticeBean();
			article.setNum(num);
			article.setId(multi.getParameter("id"));
			article.setSubject(multi.getParameter("subject"));
			article.setContent(multi.getParameter("content"));
			article.setFile(multi.getOriginalFileName("file"));
			Boolean isModifySuccess = noticeModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				response.setContentType("text/html : charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}else {
				forward = new NoticeActionForward();
				forward.setPath("NoticeBoardDetail.not?num="+ num + "&page=" + page);
				forward.setRedirect(true);
			}
			
		}
		
		
		return forward;
	}

}
