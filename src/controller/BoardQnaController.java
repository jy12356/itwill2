package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.qna.QnaModifyFormAction;
import action.qna.QnaModifyProAction;
import action.qna.QnaReplyFormAction;
import action.qna.QnaReplyProAction;
import action.qna.QnaDeleteProAction;
import action.qna.QnaDetailAction;
import action.qna.QnaListAction;
import action.qna.QnaWriteProAction;
import vo.ActionForward;

@WebServlet("*.qna") 
public class BoardQnaController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("요청서블릿 주소: " + command);
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/QnaWriteForm.qna")) {
			System.out.println("QnaWriteForm.qna 포워딩!!");
			
			forward = new ActionForward();
			forward.setPath("/sub5/qna.jsp");
		}else if(command.equals("/QnaWritePro.qna")) {
			
			System.out.println("QnaWritePro.qna 포워딩!!");
			action = new QnaWriteProAction();
			
			try {
				forward =  action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/QnaList.qna")) {
			action = new QnaListAction();
			try {
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(command.equals("/QnaDetail.qna")) {
			action = new QnaDetailAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/QnaModifyForm.qna")) {
			action = new QnaModifyFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/QnaModifyPro.qna")) {
			action = new QnaModifyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/QnaDeletePro.qna")) {
			action = new QnaDeleteProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/QnaReplyForm.qna")) {
			action = new QnaReplyFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/QnaReplyPro.qna")) {
			action = new QnaReplyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		
		//------------------------------------------------------------------------
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
