package action.request;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.request.RequestWriteProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestWriteProAction!");

		ActionForward forward = null;

		ServletContext context = request.getServletContext();

		String saveFolder = "/requestUpload";

		String realFolder = context.getRealPath(saveFolder);

		int fileSize = 1024 * 1024 * 10;

		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
		);
		
		RequestBean requestBean = new RequestBean();
		requestBean.setId(multi.getParameter("id"));
		requestBean.setSubject(multi.getParameter("subject"));
		requestBean.setAuthor(multi.getParameter("author"));
		requestBean.setPublisher(multi.getParameter("publisher"));
		requestBean.setPubdate(multi.getParameter("pubdate"));
		requestBean.setIsbn(multi.getParameter("isbn"));
		requestBean.setContent(multi.getParameter("content"));
		requestBean.setFile(multi.getOriginalFileName("file"));

		RequestWriteProService requestWriteProService = new RequestWriteProService();
		boolean isWriteSuccess = requestWriteProService.registArticle(requestBean);

		if (!isWriteSuccess) {

			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('글 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("RequestList.rq");
			forward.setRedirect(true);
		}

		return forward;
	}

}
