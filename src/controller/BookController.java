package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.book.BookDeleteProAction;
import action.book.BookDetailAction;
import action.book.BookDibsDeleteAction;
import action.book.BookDibsListAction;
import action.book.BookDibsListInsertAction;
import action.book.BookKindListAction;
import action.book.BookListAction;
import action.book.BookListAllAction;
import action.book.BookModifyAction;
import action.book.BookModifyProAction;
import action.book.BookRegiSearchAction;
import action.book.BookRegiSerchAction;
import action.book.BookWriteProAction;
import action.review.ReviewWriteProAction;
import vo.ActionForward;
@WebServlet("*.bok") 
public class BookController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("요청서블릿 주소: " + command);
		Action action = null;
		ActionForward forward = null;
		if(command.equals("/BookWriteForm.bok")) {
			System.out.println("BookWriteForm.bo 포워딩");
			forward = new ActionForward();
			forward.setPath("/adminPage/book_regi.jsp");
		}else if(command.equals("/BookWritePro.bok")) {
			System.out.println("BookWritePro.bok 포워딩");
			action = new BookWriteProAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/BookDetail.bok")) {
			System.out.println("BookDetail.bok 포워딩");
			action = new BookDetailAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/BookModify.bok")) {
			System.out.println("BookModify.bok 포워딩");
			action = new BookModifyAction();
			try {
				forward =  action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookModifyPro.bok")) {
			System.out.println("BookModifyPro.bok 포워딩");
			action = new BookModifyProAction();
			try {
				forward =  action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookKindList.bok")) {
			System.out.println("BookKindList.bo 포워딩");
			forward = new ActionForward();
			action = new BookKindListAction();
			try {
				forward =  action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			forward.setPath("/adminPage/boolKindList.jsp");
		}else if(command.equals("/BookDeletePro.bok")) {
			System.out.println("BookDelete.bok 포워딩");
			action = new BookDeleteProAction();
			try {
				forward =  action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}			
		}else if(command.equals("/BookList.bok")) {
			System.out.println("BookList.bok 포워딩");
			action = new BookListAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookRegiSerch.bok")) {
			System.out.println("BookRegiSerch.bok 포워딩");
			action = new BookRegiSerchAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookDibsList.bok")) {
			System.out.println("BookDibsList.bok 포워딩");
			action = new BookDibsListAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookDibsInsert.bok")) {
			System.out.println("BookDibsInsert.bok 포워딩");
			action = new BookDibsListInsertAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookDibsDelete.bok")) {
			System.out.println("BookDibsDelete.bok 포워딩");
			action = new BookDibsDeleteAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookNaverAPISearch.bok")) {
			System.out.println("BookNaverAPISearch.bok 포워딩");
			action = new BookRegiSearchAction();
			try {				
				forward =  action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/BookAllList.bok")) {
			System.out.println("BookAllList.bok 포워딩");
			action = new BookListAllAction();
			try {				
				forward =  action.execute(request, response);
				
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
