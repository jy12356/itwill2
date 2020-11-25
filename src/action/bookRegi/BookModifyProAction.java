package action.bookRegi;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.book.BookModifyProService;
import vo.ActionForward;
import vo.BookBean;

public class BookModifyProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String page = request.getParameter("page");
		ServletContext context = request.getServletContext();
		String saveFolder = "/bookUpload"; //가상 폴더
		String realForder = context.getRealPath(saveFolder);
		int fileSize = 1024*1024 *10; //파일크기
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request)객체 
				realForder,//실제업로드 폴더
				fileSize, // 한번에 업로드 가능한 1개 파일 최대 크기
				"UTF-8",// 파일명에 대한 인코딩 방식
				new DefaultFileRenamePolicy()// 파일명 중복시 중복처리 객체
		);
		BookBean bookBean = new BookBean();
		bookBean.setTitle(multi.getParameter("title"));
		bookBean.setIsbn(multi.getParameter("isbn"));
		bookBean.setAuthor(multi.getParameter("author"));
		bookBean.setAuthor_info(multi.getParameter("author_info"));
		bookBean.setCatg1(multi.getParameter("catg1"));
		bookBean.setCatg2(multi.getParameter("catg2"));
		bookBean.setDescription(multi.getParameter("description"));
		bookBean.setIndex(multi.getParameter("index"));
		bookBean.setPubdate(multi.getParameter("pubdate"));
		bookBean.setPublisher(multi.getParameter("publisher"));
		bookBean.setImage(multi.getOriginalFileName("image"));
		
		BookModifyProService bookModifyProService = new BookModifyProService(); 
		boolean ismodify = bookModifyProService.modifyBook(bookBean);
		if(!ismodify) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("alert('회원가입 실패!')"); //다이얼로그 메세지 출력
			out.println("history.back()");//이전페이지로 이동
			out.println("</script>");// 자바스크립트끝태그
		}else {
			forward = new ActionForward();
			forward.setPath("BookDetail.bok?isbn="+bookBean.getIsbn()+"&page="+page+"&title="+bookBean.getTitle());
			forward.setRedirect(true);			
		}
		return forward;
	}
	
}
