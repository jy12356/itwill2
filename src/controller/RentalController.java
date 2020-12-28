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
import action.mybasket.BasketDeleteAction;
import action.mybasket.MyBasketInsertAction;
import action.mybasket.MyBasketListAction;
import action.rental.RentalInsertAction;
import action.rental.RentalListAction;
import action.rental.ReservationDeleteAction;
import action.rental.ReservationListAction;
import action.rental.rentalDeleteAction;
import action.rental.reservationInsertAction;
import action.rental.returnAction;
import action.rental.returnAction2;
import action.rental.returnInsertAction;
import vo.ActionForward;

@WebServlet("*.rn")
public class RentalController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();

		System.out.println("RentalController : " + command);

		Action action = null;
		ActionForward forward = null;

		if (command.equals("/rental.rn")) {
			forward = new ActionForward();
			forward.setPath("/myPage/rental.jsp");
			
		} else if (command.equals("/rentalInsert.rn")) {
			action = new RentalInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/rentalList.rn")) {
			action = new RentalListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/reservationInsert.rn")) {
			action = new reservationInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/rentalDelete.rn")) {
			action = new rentalDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	// 반납용
		} else if (command.equals("/Return.rn")) {
			action = new returnAction();
//=======
//		} else if (command.equals("/ReservationList.rn")) {
	//		action = new ReservationListAction();
//>>>>>>> master
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			

//	 과거주문내역	
	}else if (command.equals("/ReturnInsert.rn")) {
			action = new returnInsertAction();
//=======
//		} else if (command.equals("/reservationDelete.rn")) {
//			action = new ReservationDeleteAction();
//>>>>>>> master
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}else if (command.equals("/Return2.rn")) {
		action = new returnAction2();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		
		
		
		

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
