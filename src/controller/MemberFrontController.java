package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberDeleteFormAction;
import action.MemberListAction;
import action.MemberWriteProAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		System.out.println("요청 서블릿 주소 : " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/MemberWriteForm.me")) {
			forward = new ActionForward();
			forward.setPath("/sub1/join.jsp");
		} else if(command.equals("/MemberWritePro.me")) {  
			action = new MemberWriteProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberList.me")) {
			
			System.out.println("MemberList.me 로 포워딩!");
			
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
				forward.setPath("/sub1/update.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else if(command.equals("/MemberDeleteForm.me")) {
			
			System.out.println("MemberDeleteForm");
			
			action = new MemberDeleteFormAction();
			try {
				forward = new ActionForward();
				forward.setPath("/sub1/delete.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else { 
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			// ----------------------------------------------------------------
		
		}
		
	}   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
 