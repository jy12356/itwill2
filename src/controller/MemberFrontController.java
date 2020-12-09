package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberCheckAction;
import action.MemberDeleteFormAction;
import action.MemberJoinProService;
import action.MemberListAction;
import action.MemberLoginProAction;
import action.MemberModifyFormAction;
import action.MemberModifyProAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		System.out.println("MemberFrontController : " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/MemberJoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/sub1/join.jsp");
		} else if(command.equals("/MemberJoinPro.me")) {  
			action = new MemberJoinProService();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberLoginForm.me")) {
			System.out.println("MemberLoginForm");
			try {
				forward = new ActionForward();
				forward.setPath("/sub1/login.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberLoginePro.me")) {  
			action = new MemberLoginProAction();
			
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberModifyForm.me")) {
			System.out.println("MemberModifyForm");
			action = new MemberModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/MemberModifyPro.me")) {  
			System.out.println("MemberModifyPro");
			action = new MemberModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberList.me")) {
			
			System.out.println("MemberList.me!");
			
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
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
			
		} else if(command.equals("/MemberDeletePro.me")) {
			System.out.println("MemberDeleteForm");
			
//			action = new MemberDeleteProAction();
			try {
				forward = action.execute(request, response);
				forward = new ActionForward();
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if(command.equals("/MemberCheck.me")) {
			System.out.println("MemberCheck");
			action = new MemberCheckAction();
			try {
				forward = action.execute(request, response);
				forward = new ActionForward();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/Mypage.me")) {
			System.out.println("Mypage");
			action = new MyPageAction();
			try {
				forward = action.execute(request, response);
				forward = new ActionForward();
				forward.setPath("/sub1/mypage.jsp");
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
			// ----------------------------------------------------------------joinPagePrac.jsp
		
		}
		
	}   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

}
 