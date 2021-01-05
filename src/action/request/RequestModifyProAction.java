package action.request;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.request.RequestModifyProService;
import vo.ActionForward;
import vo.RequestBean;

public class RequestModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RequestModifyProAction");

		ActionForward forward = null;
		
//		ServletContext context = request.getServletContext();
//		
//		String saveFolder = "/requestUpload";
//		
//		String realFolder = context.getRealPath(saveFolder);
//		
//		int fileSize = 1024 * 1024 * 10;
//		MultipartRequest multi = new MultipartRequest(
//				request, // HttpServletRequest(request) 객체 
//				realFolder, // 실제 업로드 폴더 
//				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
//				"UTF-8", // 파일명에 대한 인코딩 방식 
//				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
//				);

		int num = Integer.parseInt(request.getParameter("num"));
		
		RequestBean article = new RequestBean();
		
		article.setNum(num);
		article.setSubject(request.getParameter("subject"));
		article.setAuthor(request.getParameter("author"));
		article.setPublisher(request.getParameter("publisher"));
		article.setPubdate(request.getParameter("pubdate"));
		article.setIsbn(request.getParameter("isbn"));
		article.setContent(request.getParameter("content"));
		article.setFile(request.getParameter("file"));
				
		System.out.println("num : " + num);
		System.out.println("id : " + request.getParameter("id"));
			
		RequestModifyProService requestModifyProService = new RequestModifyProService();
		boolean isModifySuccess = requestModifyProService.modifyArticle(article);

		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패했어요')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("RequestDetail.rq?num=" + num + "&page=" + request.getParameter("page"));
			forward.setRedirect(true);
		}

		return forward;
	}

}