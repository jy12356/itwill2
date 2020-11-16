package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardWriteProAction!");
		
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		String saveFolder = "/boardUpload";
		String realFolder = context.getRealPath(saveFolder);
		System.out.println("실제 업로드 폴더 :" + realFolder);
		//실제업로드 폴더 구조 : 워크스페이스/.metadata/.plugins/org.elipse.wet.server.core/tmp0/
		//실제 업로드 폴더 :/Users/enril/Desktop/Java/Jsp_Model2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MVC_Board/boardUpload
		
		int fileSize = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(
				request, //HttpServletRequest(request)객체 
				realFolder, //실제 업로드 폴더 
				fileSize, //한번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8",//파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() //파일명 중복 시 중복 처리 객체
				);
		
		String board_name = multi.getParameter("board_name");
		String board_pass = multi.getParameter("board_pass");
		String board_subject = multi.getParameter("board_subject");
		String board_content =multi.getParameter("board_content");
		
		String board_file = multi.getOriginalFileName("board_file");
		
//		System.out.println("글쓴이"+board_name);
//		System.out.println("비밀번호"+board_pass);
//		System.out.println("제목"+board_subject);
//		System.out.println("내용"+board_content);
//		System.out.println("파일명"+board_file);
		
		BoardBean boardBean = new BoardBean();
		boardBean.setBoard_name(multi.getParameter("board_name"));
		boardBean.setBoard_pass(multi.getParameter("board_pass"));
		boardBean.setBoard_subject(multi.getParameter("board_subject"));
		boardBean.setBoard_content(multi.getParameter("board_content"));
		boardBean.setBoard_file(multi.getOriginalFileName("board_file"));
		
		BoardWriteProService boardWriteProService = new BoardWriteProService();
		boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);
		
		if(!isWriteSuccess)	{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 등록 실패')"); 
			out.println("history.back()");
			out.println("</script>"); 
		}else {
			forward = new ActionForward();
			forward.setPath("BoardList.bo");
			forward.setRedirect(true);
		}
		return forward;
	}
}