package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminAction;
import action.SearchAllAction;
import action.book.MainListAction;
import action.msg.MsgDelAction;
import action.msg.MsgSpanAction;
import action.msg.MyMsgListAction;
import vo.ActionForward;
@WebServlet("*.msg") 
public class MsgController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("요청서블릿 주소: " + command);
		Action action = null;
		ActionForward forward = null;
		if(command.equals("/MyMsg.msg")) {
			System.out.println("MyMsg.msg 포워딩");
			action = new MyMsgListAction();			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MyMsgSpan.msg")) {
			System.out.println("MyMsgSpan.msg 포워딩");
			action = new MsgSpanAction();			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MyMsgDel.msg")) {
			System.out.println("MyMsgDel.msg 포워딩");
			action = new MsgDelAction();			
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
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	
}
