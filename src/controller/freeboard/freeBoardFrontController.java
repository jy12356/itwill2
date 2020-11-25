package controller.freeboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.freeboard.freeBoardDetailAction;
import action.freeboard.freeBoardListAction;
import action.freeboard.freeBoardModifyFormAction;
import action.freeboard.freeBoardReplyFormAction;
import action.freeboard.freeBoardWriteProAction;
import vo.ActionForward;

@WebServlet("*.free") // 서블릿 주소 중 XXX.bo 주소에 대한 요청을 전달받아 처리
public class freeBoardFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 요청 시 GET 방식 또는 POST 방식의 요청이 들어오면 
		// 공통으로 처리하기 위해 doGet(), doPost() 메서드에서 호출하는 메서드
		// => 파라미터로 request 객체와 response 객체를 전달받음
		
		// POST 방식 요청에 대한 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 서블릿 주소 가져오기
		String command = request.getServletPath();
		System.out.println("요청 서블릿 주소 : " + command);
		
		// 각 요청 처리에 필요한 객체를 다루는 변수 선언
		Action action = null;
		ActionForward forward = null;
		
		// if문을 사용하여 각 서블릿 주소 판별 및 각 요청 처리를 위한 작업 요청
		if(command.equals("/BoardWriteForm.bo")) {
			/*
			 * 글쓰기 페이지에 대한 요청은 비즈니스 로직 없이
			 * View 페이지(JSP)로 바로 포워딩 수행
			 * - 기존 서블릿 주소가 유지되어야 하므로 Dispatcher 방식 포워딩
			 *   => ActionForward 객체에 redirect 변수값을 false 로 설정
			 *      (boolean 타입 기본 값이 false 이므로 별도 설정 필요 없음)\
			 *   => 따라서, 포워딩 주소만 지정
			 * - 포워딩 주소 : board 폴더 내의 qna_board_write.jsp
			 */
			// 1. ActionForward 객체 생성(변수는 이미 선언되어 있음)
			forward = new ActionForward();
			// 2. 포워딩 경로 설정
			forward.setPath("/sub2/free_board_write.jsp");
			// 3. 포워딩 방식 설정(Dispatcher 방식)
//			forward.setRedirect(false); // 기본값이 false 이므로 설정 생략 가능
		} else if(command.equals("/FreeBoardWritePro.bo")) { // BoardWritePro.bo 서블릿 요청에 대한 처리
			// 1. BoardWriteProAction 클래스 객체 생성
			// => Action 클래스는 Action 인터페이스를 구현하므로 다형성 활용 가능
			action = new freeBoardWriteProAction();
			
			try {
				// 2. Action 클래스의 execute() 메서드 호출
				// => 리턴되는 ActionForward 객체 전달받기(직접 생성하지 않음!)
				// => throws 에 의해 예외가 전달되므로 try ~ catch 필요
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardList.bo")) {
			action = new freeBoardListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardDetail.bo")) {
			action = new freeBoardDetailAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/BoardReplyForm.bo")) {
			action = new freeBoardReplyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/BoardModifyForm.bo")) {
			action = new freeBoardModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/BoardDeleteForm.bo")) {
			forward = new ActionForward();
			forward.setPath("/board/qna_board_delete.jsp");
			
			
			
		}
		
		
		
		
		// ----------------------------------------------------------------
		// 기본적인 작업 후 공통적으로 수행할 포워딩 작업
		// 1. ActionForward 객체 존재 여부 판별(객체가 존재할 때 포워딩 수행)
		if(forward != null) {
			// 2. ActionForward 객체 내의 포워딩 방식에 따라 각각의 포워딩 수행
			// => Redirect 방식 : isRedirect() == true, 
			//    Dispatcher 방식 : isRedirect() == false
			if(forward.isRedirect()) {
				// 3. Redirect 방식일 경우 
				// response 객체의 sendRedirect() 메서드를 호출하여 포워딩
				// => 파라미터 : 포워딩 할 URL
				response.sendRedirect(forward.getPath());
			} else { 
				// 4. Dispatcher 방식일 경우
				// 4-1. request 객체의 getRequestDispatcher() 메서드를 호출하여
				//      RequestDispatcher 객체를 리턴받기
				//      => 파라미터 : 포워딩 할 URL
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
				// 4-2. RequestDispatcher 객체의 forward() 메서드를 호출하여
				//      포워딩 수행(파라미터 : request, response 객체)
				dispatcher.forward(request, response);
			}
			// ----------------------------------------------------------------
		
		}
		
	}   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 요청 시 GET 방식 요청이 들어오면 자동으로 호출되는 메서드
		// => 파라미터로 request 객체와 response 객체를 전달받음
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 요청 시 POST 방식 요청이 들어오면 자동으로 호출되는 메서드
		// => 파라미터로 request 객체와 response 객체를 전달받음
		doProcess(request, response);
	}

}
 
