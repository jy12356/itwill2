package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.gudok.ChargeListAction;
import action.gudok.ChargeProAction;
import vo.ActionForward;

@WebServlet("*.dok")
public class GudokController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("요청서블릿 주소: " + command);
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/Charge.dok")) {
			System.out.println("Charge.dok포워딩!!");
			
			forward = new ActionForward();
			forward.setPath("/sub5/charge.jsp");
		}else if(command.equals("/ChargePro.dok")) {
			
			System.out.println("ChargePro.dok 포워딩!!");
			action = new ChargeProAction();
			
			try {
				forward =  action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ChargeList.dok")) {
			action = new ChargeListAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		
		
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
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