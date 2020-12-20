package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemNameListAction;
import action.MemberCheckAction;
import action.MemberDeleteFormAction;
import action.MemberDeleteProAction;
import action.MemberJoinProService;
import action.MemberListAction;
import action.MemberLoginProAction;
import action.MemberModifyFormAction;
import action.MemberModifyProAction;
import action.member.MemListDeleteAction;
import action.member.MemberLogoutProAction;
import action.member.MyPageAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("요청서블릿 주소: " + command);
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
		} else if(command.equals("/MemberLoginPro.me")) {  
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
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberDeletePro.me")) {
			System.out.println("MemberDeletePro");
			action = new MemberDeleteProAction();
			try {
				forward = action.execute(request, response);
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
				forward = new ActionForward();
				forward.setPath("/sub5/mypage.jsp");
//				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemNameList.me")) {
			System.out.println("MemNameList");
			action = new MemNameListAction();
			try {
				forward = action.execute(request, response);
				forward = new ActionForward();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemListDelete.me")) {
			System.out.println("MemListDelete");
			action = new MemListDeleteAction();
			try {
				forward = action.execute(request, response);
				forward = new ActionForward();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberLogoutPro.me")) {
			System.out.println("MemberLogoutPro");
			action = new MemberLogoutProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//1.ActionForward객체 존재 여부 확인(객체가 존재할때 포워딩 수행)
		if(forward != null) {
			//2.ActionForward객체 내의 포워딩 방식에 따라 각각의 포워딩 수행
			//=>Redirect방식 : isRedirect() == true
			//=>Dispatcher방식 : isRedirect() == false
			if(forward.isRedirect()) {//Redirect방식일 경우
				//3.Redirect방식일 경우 
				//responese객체의 sendRedirect()메서드를 호출하여 포워딩
				//=>파라미터 :포워딩할 URL
				response.sendRedirect(forward.getPath());
			}else {
				//4. Dispatcher 방식일 경우
				//4-1. requset객체의 getRequestDispatcher()메서드를 호출하여
				//RequestDispatcher객체를 리턴받기
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				//4-2. RequestDispatcher 객체의 forward()에서드를 호출하여
				//포워딩 수행(파라미터 : request,response객체)
				dispatcher.forward(request, response);
			}
		}
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
 