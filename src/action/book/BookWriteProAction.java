package action.book;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.book.BookWriteService;
import vo.ActionForward;
import vo.BookBean;

public class BookWriteProAction implements Action {


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookWriteProAction!");
		ActionForward forward =null;
		request.setCharacterEncoding("utf-8");
		//파일업로드를 위한 소스
		ServletContext context = request.getServletContext();
		String saveFolder = "/bookUpload"; //가상 폴더
		String realForder = context.getRealPath(saveFolder);
		int fileSize = 1024*1024 *10; //파일크기
		// MultipartRequest 객체를 통해 전달받아야 하므로 객체생성 필수
		MultipartRequest multi = new MultipartRequest(
				request, // HttpServletRequest(request)객체 
				realForder,//실제업로드 폴더
				fileSize, // 한번에 업로드 가능한 1개 파일 최대 크기
				"UTF-8",// 파일명에 대한 인코딩 방식
				new DefaultFileRenamePolicy()// 파일명 중복시 중복처리 객체
		);
		
		//전달할 데이터를 BoardBean객체에 저장
		String isbn =multi.getParameter("isbn");
		String catg1= multi.getParameter("catg1");
		String catg2= multi.getParameter("catg2");
		BookBean bookBean = new BookBean();
		bookBean.setTitle(multi.getParameter("title"));
		if(multi.getOriginalFileName("image") !=null) {
			System.out.println(multi.getOriginalFileName("image"));
			bookBean.setImage(multi.getOriginalFileName("image"));
		}else {
			bookBean.setImage("noimg.jpg");
		}
		bookBean.setAuthor(multi.getParameter("author"));
		bookBean.setPublisher(multi.getParameter("publisher"));
		bookBean.setPubdate(multi.getParameter("pubdate"));
		bookBean.setIsbn(multi.getParameter("isbn"));
		bookBean.setDescription(multi.getParameter("description"));
		bookBean.setCatg1(multi.getParameter("catg1"));
		bookBean.setCatg2(multi.getParameter("catg2"));
		bookBean.setAuthor_info(multi.getParameter("author_info"));
		bookBean.setIndex(multi.getParameter("index"));
		BookWriteService bookWriteServie = new BookWriteService();
		boolean isIsbn = bookWriteServie.selectIsbn(isbn);
		if(!isIsbn) {
			boolean isWriteSuccess = bookWriteServie.insertBook(bookBean);
			if(!isWriteSuccess) {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('책 등록을 실패하였습니다.')"); // 다이얼로그 메세지 출력
				out.println("history.back()"); // 이전 페이지로 이동
				out.println("</script>"); // 자바스크립트 끝 태그
			} else {
				String catg1r=URLEncoder.encode(bookBean.getCatg1(),"UTF-8");
				String catg2r=URLEncoder.encode(bookBean.getCatg2(),"UTF-8");
				System.out.println("등록되었습니다.");
				forward = new ActionForward();
				System.out.println(bookBean.getCatg1() +", " +bookBean.getCatg2());
//				forward.setPath("BookList.bok?catg1="+URLDecoder.decode(bookBean.getCatg1(), "UTF-8")+"&catg2="+URLDecoder.decode(bookBean.getCatg2(),"UTF-8"));
				forward.setPath("BookList.bok?catg1="+catg1r+"&catg2="+catg2r);
				System.out.println(forward.getPath());
				forward.setRedirect(true);
			}
		}else{
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('이미 등록된 책입니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		}
		return forward;
	}
}
