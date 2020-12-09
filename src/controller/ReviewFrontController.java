package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.review.ReCommentDeleteProAction;
import action.review.ReCommentListAction;
import action.review.ReCommentModifyProAction;
import action.review.ReCommentWriteProAction;
import action.review.ReviewDeleteProAction;
import action.review.ReviewListAction;
import action.review.ReviewModifyProAction;
import action.review.ReviewWriteProAction;
import action.review.ReviewLikeCountAction;
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
		
		if(command.equals("/BookDetail.re")) { // 상세보기
			System.out.println("BookDetail.re 포워딩");
			action = new ReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if(command.equals("/ReviewWritePro.re")) { // 서평쓰기
			System.out.println("ReviewWritePro.re 포워딩");
			action = new ReviewWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
		} else if(command.equals("/ReviewModifyPro.re")) { // 서평수정
			System.out.println("ReviewModifyPro.re 포워딩");
			action = new ReviewModifyProAction();
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
		} else if(command.equals("/ReCommentWritePro.re")) { // 댓글쓰기
			System.out.println("ReCommentWritePro.re 포워딩");
			action = new ReCommentWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/ReCommentModifyPro.re")) { // 댓글수정
			System.out.println("ReCommentModifyPro.re 포워딩");
			action = new ReCommentModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/ReCommentDeletePro.re")) { // 댓글삭제
			System.out.println("ReCommentDeletePro.re 포워딩");
			action = new ReCommentDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/ReCommentList.re")) { // 댓글 리스트
			System.out.println("ReCommentList.re 포워딩");
			action = new ReCommentListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/ReviewlikeCount.re")) { // 댓글 리스트
			System.out.println("ReviewlikeCount.re 포워딩");
			action = new ReviewLikeCountAction();
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
