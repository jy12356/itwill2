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
		request.setCharacterEncoding("utf-8");
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
		String page = multi.getParameter("page");
		String title= multi.getParameter("title1");
		String isbn= multi.getParameter("isbn1");
		BookBean bookBean = new BookBean();
		bookBean.setTitle(multi.getParameter("title"));
		bookBean.setIsbn(multi.getParameter("isbn"));
		bookBean.setAuthor(multi.getParameter("author"));
		bookBean.setCatg1(multi.getParameter("catg1"));
		bookBean.setCatg2(multi.getParameter("catg2"));
		bookBean.setPubdate(multi.getParameter("pubdate"));
		bookBean.setPublisher(multi.getParameter("publisher"));
		if(multi.getParameter("description") ==null) {
			bookBean.setDescription("요약정보가 없습니다.");
		}else {			
			bookBean.setDescription(multi.getParameter("description"));
		}
		if(multi.getParameter("author_info") ==null) {
			bookBean.setAuthor_info("저자상세정보가 없습니다.");
		}else {			
			bookBean.setAuthor_info(multi.getParameter("author_info"));
		}
		if(multi.getParameter("index") ==null) {
			bookBean.setIndex("저자상세정보가 없습니다.");
		}else {			
			bookBean.setIndex(multi.getParameter("index"));
		}
		if(multi.getOriginalFileName("image") == null){
			bookBean.setImage(multi.getParameter("oldimage"));
		}else {
			bookBean.setImage(multi.getOriginalFileName("image"));
		}
		
		BookModifyProService bookModifyProService = new BookModifyProService(); 
		boolean ismodify = bookModifyProService.modifyBook(bookBean,title, isbn);
		if(!ismodify) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");// 자바스크립트끝태그
			out.println("alert('책정보 수정 실패!')"); //다이얼로그 메세지 출력
			out.println("history.back()");//이전페이지로 이동
			out.println("</script>");// 자바스크립트끝태그
		}else {
			forward = new ActionForward();
			forward.setPath("BookDetail.bok?isbn="+bookBean.getIsbn()+"&page="+page);
			forward.setRedirect(true);			
		}
		return forward;
	}
	
}
