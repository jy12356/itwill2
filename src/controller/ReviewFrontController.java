package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.review.ReviewDeleteProAction;
import action.review.ReviewListAction;
import action.review.ReviewWriteProAction;
import vo.ActionForward;


@WebServlet("*.re")
public class ReviewFrontController extends HttpServlet {
	
	protected void doprocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewFrontController");
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		System.out.println("요청서블릿 주소: " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/BookDetail.re")) {
			System.out.println("BookDetail.re 포워딩");
			
			action = new ReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			forward = new ActionForward();
//			forward.setPath("/sub1/detail.jsp");
//			
		} else if(command.equals("/ReviewWritePro.re")) {
			System.out.println("ReviewWritePro.re 포워딩");
			action = new ReviewWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		} else if(command.equals("/ReviewDeletePro.re")) {
			System.out.println("ReviewDeletePro.re 포워딩");
			action = new ReviewDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doprocess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doprocess(request, response);

	}

}
