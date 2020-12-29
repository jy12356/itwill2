package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.alarm.AlarmDeleteProAction;
import action.alarm.AlarmListAction;
import vo.ActionForward;

@WebServlet("*.al")
public class AlarmController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		System.out.println("요청 서블릿 주소 : " + command);
		
		Action action = null;
		ActionForward forward = null;

		if (command.equals("/AlarmWriteForm.al")) {
			System.out.println("AlarmWriteForm.al");
			forward = new ActionForward();
			forward.setPath("/sub4/Alarm_board_write.jsp");
			System.out.println(forward.getPath());

		} else if (command.equals("/AlarmWritePro.al")) {
			action = new AlarmWriteProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/AlarmList.al")) {
			action = new AlarmListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/AlarmDeleteForm.al")) {
			forward = new ActionForward();
			forward.setPath("/sub4/alarm_board_delete.jsp");
			
		} else if(command.equals("/AlarmDeletePro.al")) {
			action = new AlarmDeleteProAction();
			
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