package action.NoticeAction;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.NoticeSvc.NoticeWriteProService;
import vo.NoticeVo.NoticeActionForward;
import vo.NoticeVo.NoticeBean;

public class NoticeWriteProAction implements action.NoticeAction.NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeWriteProAction");
		
		NoticeActionForward forward = null;
		
		// 현재 컨텍스트(객체) 정보 가져오기 위해 
				// request 객체의 getServletContext() 메서드를 호출
				ServletContext context = request.getServletContext();
				
				// 프로젝트 상에서 설정한 가상 업로드 폴더 경로 지정
				// 현재 루트 위치가 webcontent 폴더이므로 하위 폴더를 "/하위폴더명" 지정
				String saveFolder = "/noticeUpload";
				
				// 가상 폴더에 대응하는 실제 폴더 위치를 가져오기 위해
				// ServletContext 객체의 getRealPath() 메서드를 호출
				// => 파라미터 : 가상 업로드 폴더 경로
				String realFolder = context.getRealPath(saveFolder);
				System.out.println("실제 업로드 폴더 : " + realFolder); // 경로 확인
				// 실제 업로드 폴더 구조 : 워크스페이스\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\프로젝트명\업로드폴더명
				// 실제 업로드 폴더 : D:\Shared\JSP_Model2\workspace_jsp_model2\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MVC_Board\boardUpload
				
				// 업로드 할 최대 파일 크기 지정(Byte 단위)
				// ex) 1MByte = 1,024KByte = 1,048,576Byte  
//				int fileSize = 1048576; // 직접적인 크기를 명시하지 않도록 한다!
				// 작은 단위로 분할해서 해당 크기에 맞게 연산 수행하도록 지정해야 수정 쉬움
//				int fileSize = 1024 * 1024; // 1024Byte * 1024Byte = 1,048,576Byte = 1MByte
				int fileSize = 1024 * 1024 * 10; // 10MByte 크기 지정
				
				// 뷰페이지(JSP) 에서 전달된 파라미터들이 
				// enctype="multipart/form-data" 타입으로 전달될 경우
				// 일반 request 객체가 아닌 MultipartRequest 객체를 통해 전달받아야 하므로
				// MultipartRequest 객체 생성 필수!
				// MultiPartRequest 객체를 가져와서
				// 전달받은 파라미터(글쓴이, 비밀번호, 글제목, 내용, 작성일) 가져오기
				MultipartRequest multi = new MultipartRequest(
						request, // HttpServletRequest(request) 객체 
						realFolder, // 실제 업로드 폴더 
						fileSize, // 한 번에 업로드 가능한 1개 파일 최대 크기 
						"UTF-8", // 파일명에 대한 인코딩 방식 
						new DefaultFileRenamePolicy() // 파일명 중복 시 중복 처리 객체
				);
				
				// 주의! request객체의 getParameter() 메서드가 아닌
				// MultipartRequest 객체의 getparameter() 메서드 호출 필수
//				String board_name = multi.getParameter("board_name");
//				String board_pass = multi.getParameter("board_pass");
//				String board_subject = multi.getParameter("board_subject");
//				String board_content = multi.getParameter("board_content");
//				System.out.println((String)multi.getFileNames().nextElement());
//				String board_file = multi.getfile
				
				// 업로드 파일명 가져오기(파라미터 이름은 직접 지정해도 무관)
				// getOriginalFileName() 은 업로드시 지정된 파일명
				// => 주로, 화면에 표시할 파일명
//				System.out.println("getoriginalfilename() : " + multi.getOriginalFileName("board_file"));
				// getFileSystemName()은 실제 업로드 될 때 중복 처리까지 완료된 실제 파일명
				// => 주로, 다운로드시 실제 다운로드 링크로 사용할 파일명으로 사용
//				System.out.println("getFileSystemName() : " + multi.getFilesystemName("board_file"));
				
				// 현재 프로젝트에서는 다운로드 중요성이 낮으므로
				// 원본 파일과 실제 업로드 파일명 구분없이 원본 파일명만 사용
				// => 실제 프로젝트에서 다운로드가 필요할 경우
				// 원본 파일명과 실제 업로드 파일명을 모두 DB에 저장하면 됨
//				String board_file = multi.getOriginalFileName("board_file");

				
//				System.out.println("글쓴이 : " + board_name);
//				System.out.println("패스워드 : " + board_pass);
//				System.out.println("글제목 : " + board_subject);
//				System.out.println("글내용 : " + board_content);
//				System.out.println("파일명 : " + board_file);
				//-----------------------------------------------------------------------------------------------------------
				NoticeBean noticeBean = new NoticeBean();
				noticeBean.setId(multi.getParameter("id"));
				noticeBean.setSubject(multi.getParameter("subject"));
				noticeBean.setContent(multi.getParameter("content"));
				noticeBean.setFile(multi.getOriginalFileName("file")); // 주의!
					
				
				// -----------------------------------------------------------------------------------------------------------
				// 서비스 클래스를 통해 실제 글 등록 작업 수행을 위한 요청
				// BoardWriteProService 클래스의 인스턴스 생성후
				// regisArticle() 메서드를 호출하여 글 등록 작업 수행 요청
				// => 파라미터 : BoardBean, 리턴타입 : boolean(isWriteSuccess)
				NoticeWriteProService noticeWriteProService = new NoticeWriteProService();
				boolean isWriteSuccess = noticeWriteProService.registArticle(noticeBean);
				
						// 글쓰기 작업 수행 후 리턴 받은 결과값으 ㄹ사용하여
				// 글쓰기 성공 / 실패여부를 판단
				// 만약 실패했을경우 자바스크립트를 사용하여 이전페이지로 이동
				// 성공 했을경우 ActionForward 객체를 생성하여
				// 포워딩 경로(BoardList.bo) 와 방식(새 요청이므로 Redirect) 지정
				
				if(!isWriteSuccess) {
					
					// 글쓰기 작업 실패시 자바 스크립트롤 
					// 통해서 실패 메시지 출력 후 이전 페이지로 이동
					// java코드를 사용하여 jsp(응답페이지) 생성
					// 1. response 객체를 사용해서 setContentType() 메서드를 호출하여
					// 문서 타입 및 인코딩 방식 설정
					
					response.setContentType("text/html; charset=UTF-8"); 
					
					// 2. response 객체의 getWrite() 메서드를 호출하여
					//	  출력스트림 객체를 리턴받아 PrintWriter 타입으로 저장
					// 스트림( 데이터들 내보내고 받는거 ) 
					PrintWriter out = response.getWriter();
					// 3. PrintWriter 객체의 println() 메서드를 호출하여
					//	  응답페이지에서 수행할 작업을 기술
					//	  => 모든 작업(자바스크립트, 태그 등)은 문자열로 지정
					
					out.println("<script>"); // 자바스크립트 시작 태그
					out.println("alert('글 등록 실패!')"); // 다이얼로그 메세지 출력
					out.println("history.back()"); // 이전 페이지로 이동
					out.println("</script>"); // 자바스크립트 끝 태그
					
				} else {
					
					// 1. ActionForward 객체 생성
					forward = new NoticeActionForward();
					// 2. 포워딩 경로(URL) 지정
					// Redirect방식에서 / 붙여서 쓰면 project명 날라간다. http://localhost:8080/BoardList.bo
//				forward.setPath("/BoardList.bo");  // 주의! 경로명앞에 슬래시(/) 기호 붙이지 말 것!
					forward.setPath("NoticeBoardList.not");
					
					// 3. 포워딩 방식(Redirect 방식) 지정
					forward.setRedirect(true);
				}
				
				
				// 4. ActionForward 객체 리턴 => BoardFrontController 클래스로 전달
				

				return forward;
				
				
				
				
				
			}
		
	}