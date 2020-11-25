package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.request.RequestDeleteProAction;
import action.request.RequestDetailAction;
import action.request.RequestListAction;
import action.request.RequestModifyFormAction;
import action.request.RequestModifyProAction;
import action.request.RequestReplyFormAction;
import action.request.RequestReplyProAction;
import action.request.RequestWriteProAction;
import vo.ActionForward;

@WebServlet("*.rq")
public class RequestFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		System.out.println("요청 서블릿 주소 : " + command);
		
		Action action = null;
		ActionForward forward = null;

		if (command.equals("/RequestWriteForm.rq")) {
			System.out.println("RequestWriteForm.rq");
			forward = new ActionForward();
			forward.setPath("/sub4/request_board_write.jsp");
			System.out.println(forward.getPath());

		} else if (command.equals("/RequestWritePro.rq")) {
			action = new RequestWriteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/RequestList.rq")) {
			action = new RequestListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/RequestDetail.rq")) {
			action = new RequestDetailAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/RequestReplyForm.rq")) {
			action = new RequestReplyFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/RequestReplyPro.rq")) {
			action = new RequestReplyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
		} else if(command.equals("/RequestModifyForm.rq")) {
			action = new RequestModifyFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/RequestModifyPro.rq")) {
			action = new RequestModifyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/RequestDeleteForm.rq")) {
			forward = new ActionForward();
			forward.setPath("/sub4/request_board_delete.jsp");
			
		} else if(command.equals("/RequestDeletePro.rq")) {
			action = new RequestDeleteProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		// ----------------------------------------------------------------

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			// ----------------------------------------------------------------

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 서블릿 요청 시 GET 방식 요청이 들어오면 자동으로 호출되는 메서드
		// => 파라미터로 request 객체와 response 객체를 전달받음
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 서블릿 요청 시 POST 방식 요청이 들어오면 자동으로 호출되는 메서드
		// => 파라미터로 request 객체와 response 객체를 전달받음
		doProcess(request, response);
	}

}