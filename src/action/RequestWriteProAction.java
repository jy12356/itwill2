package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.RequestWriteProService;
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

		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		RequestBean requestBean = new RequestBean();
		requestBean.setNum(multi.getParameter("num"));
		requestBean.setId(multi.getParameter("id"));
		requestBean.setSubject(multi.getParameter("subject"));
		requestBean.setAuthor(multi.getParameter("author"));
		requestBean.setPublisher(multi.getParameter("publisher"));
		requestBean.setPubdate(multi.getParameter("pubdate"));
		requestBean.setIsbn(multi.getParameter("isbn"));
		requestBean.setContent(multi.getParameter("content"));
		requestBean.setFile(multi.getOriginalFileName("file"));
		requestBean.setRe_ref(multi.getParameter("re_ref"));
		requestBean.setRe_lev(multi.getParameter("re_lev"));
		requestBean.setRe_seq(multi.getParameter("re_seq"));
		requestBean.setDate(multi.getParameter("date"));

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
			forward.setPath("RequestList.bo");
			forward.setRedirect(true);
		}

		return forward;
	}

}
