package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberJoinProService;
import action.mybasket.MyBasketInsertAction;
import action.mybasket.MyBasketListAction;
import vo.ActionForward;

@WebServlet("*.bk")
public class MyBasketController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();

		System.out.println("BookBasketController : " + command);

		Action action = null;
		ActionForward forward = null;

		if (command.equals("/MyBasket.bk")) {
			forward = new ActionForward();
			forward.setPath("/myPage/my_basket.jsp");
			
		} else if (command.equals("/MyBasketInsert.bk")) {
			System.out.println("control 넘어온값 : " + request.getParameter("isbn"));
			action = new MyBasketInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/MyBasketList.bk")) {
			action = new MyBasketListAction();
			try {
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} 

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());

				dispatcher.forward(request, response);
			}
			// ----------------------------------------------------------------joinPagePrac.jsp

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
