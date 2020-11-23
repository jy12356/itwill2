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
		requestBean.setRequest_name(multi.getParameter("name"));
		requestBean.setRequest_pass(multi.getParameter("pass"));
		requestBean.setRequest_subject(multi.getParameter("subject"));
		requestBean.setRequest_content(multi.getParameter("content"));
		requestBean.setRequest_file(multi.getOriginalFileName("file"));

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
