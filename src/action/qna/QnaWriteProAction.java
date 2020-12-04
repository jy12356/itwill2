package action.qna;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.qna.QnaWriteProService;
import vo.ActionForward;
import vo.QnaBean;

public class QnaWriteProAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaWriteProAction!!");
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		String saveFolder = "/qnaboardupload";
		String realFolder = context.getRealPath(saveFolder);
		System.out.println("실제 업로드 폴더 : " + realFolder);
		int fileSize = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명
				);
		QnaBean qnaBean = new QnaBean();
		qnaBean.setQna_genre(multi.getParameter("qna_genre"));
		qnaBean.setId(multi.getParameter("id"));
		qnaBean.setPass(multi.getParameter("pass"));
		qnaBean.setTitle(multi.getParameter("title"));
		qnaBean.setContent(multi.getParameter("content"));
		
		QnaWriteProService qnaWriteProService = new QnaWriteProService();
		boolean isWriteSuccess = qnaWriteProService.registArticle(qnaBean);
		
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 등록 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("QnaList.qna");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
