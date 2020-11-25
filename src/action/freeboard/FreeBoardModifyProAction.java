package action.freeboard;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.freeboard.FreeBoardModifyProService;
import vo.ActionForward;
import vo.FreeBoardBean;

public class FreeBoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 특정 게시물 수정을 요청하는 Action 클래스
		System.out.println("!!!!!FreeBoardModifyProAction");
		
		ActionForward forward = null;
		
		ServletContext context = request.getServletContext();
		String saveFolder = "/FreeboardUpload";
		String realFolder = context.getRealPath(saveFolder);
		int fileSize = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request) 객체 
				realFolder, // 실제 업로드 폴더 
				fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
				"UTF-8", // 파일명에 대한 인코딩 방식 
				new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
				);
		// 게시물 수정에 필요한 글번호(board_num) 가져오기
//		System.out.println(Integer.parseInt(request.getParameter("board_num")));
//		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		int board_num = Integer.parseInt(multi.getParameter("board_num"));
		// BoardModifyProService 클래스 인스턴스 생성 후
		// isArticleWriter() 메서드를 호출하여 적합한 사용자인지 판별
		// => 적합한 사용자 : 패스워드가 DB 에 저장된 패스워드와 일치하는 경우
		// => 파라미터 : 글번호(board_num), 패스워드(board_pass)
		//    리턴타입 : boolean(isRightUser)
		System.out.println("FreeBoardModifyProAction - 1");
		FreeBoardModifyProService freeBoardModifyProService = new FreeBoardModifyProService();
//		boolean isRightUser = freeBoardModifyProService.isArticleWriter(
//								board_num, request.getParameter("id"));
		boolean isRightUser = freeBoardModifyProService.isArticleWriter(
				board_num, multi.getParameter("id"));
		
		// 임시확인용 isRightUser 출력
//		System.out.println(isRightUser);
		
		// 적합한 사용자 판별에 따른 처리
		if(!isRightUser) {
			// 패스워드가 틀릴 경우(= 적합한 사용자가 아닐 경우)
			// => 자바스크립트를 사용하여 "수정 권한이 없습니다!" 출력 후 
			//    이전페이지로 이동
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			// 패스워드가 일치할 경우(= 적합한 사용자일 경우)
			// BoardBean 객체 생성하여 수정폼으로부터 전달받은 항목을 저장
			// => 글번호, 작성자, 제목, 내용
			FreeBoardBean article = new FreeBoardBean();
			article.setBoard_num(board_num);
//			article.setBoard_id(request.getParameter("id"));
//			article.setBoard_subject(request.getParameter("title"));
//			article.setBoard_content(request.getParameter("desc"));
//			article.setBoard_file(request.getParameter("file"));
			article.setBoard_id(multi.getParameter("id"));
			article.setBoard_subject(multi.getParameter("title"));
			article.setBoard_content(multi.getParameter("desc"));
			article.setBoard_file(multi.getOriginalFileName("file"));
			// BoardModifyProService 클래스의 modifyArticle() 메서드를 호출하여
			// 글 수정 작업 요청
			// => 파라미터 : BoardBean, 리턴타입 : boolean(isModifySuccess)
			boolean isModifySuccess = 
					freeBoardModifyProService.modifyArticle(article);
			System.out.println("ProAction isModifySuccess 뒤");
			// 수정 결과에 따른 처리
			// => 수정 실패(isModifySuccess 가 false)일 경우 
			//    자바스크립트를 사용하여 "글 수정 실패!" 출력 후 
			//    이전페이지로 이동
			// => 아니면 ActionForward 객체 생성 후 BoardDetail.bo 로 포워딩
			//    새 요청이 발생하므로 Redirect 방식으로 이동
			//    파라미터로 글번호(board_num)와 페이지번호(page) 전달 필요
			if(!isModifySuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
//				forward.setPath("FreeBoardDetail.free?board_num=" + board_num + 
//										"&page=" + request.getParameter("page"));
				forward.setPath("FreeBoardDetail.free?board_num=" + board_num + 
						"&page=" + multi.getParameter("page"));
				forward.setRedirect(true);
			}
			
		}
		
		
		return forward;
	}

}












