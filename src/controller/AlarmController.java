package com.hanjum.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanjum.action.Action;
import com.hanjum.board.action.EditorInfoAction;
import com.hanjum.board.action.EditorListAction;
import com.hanjum.board.action.EditorSearchListAction;
import com.hanjum.board.action.EditorUpdateProAction;
import com.hanjum.board.action.EditorWriteProAction;
import com.hanjum.board.action.EnterDeleteProAction;
import com.hanjum.board.action.EnterInfoAction;
import com.hanjum.board.action.EnterListAction;
import com.hanjum.board.action.EnterSearchListAction;
import com.hanjum.board.action.EnterUpdateProAction;
import com.hanjum.board.action.EnterWriteProAction;
import com.hanjum.board.action.ProjectDeleteProAction;
import com.hanjum.board.action.ProjectInfoAction;
import com.hanjum.board.action.ProjectListAction;
import com.hanjum.board.action.ProjectSearchListAction;
import com.hanjum.board.action.ProjectUpdateProAction;
import com.hanjum.board.action.ProjectWriteProAction;
import com.hanjum.vo.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		System.out.println("요청 서블릿 주소 : " + command);
		
		Action action = null;
		ActionForward forward = null;
		
//============================== FRONT ======================================

		 if(command.equals("/ProjectWrite.bo")) { // 프로젝트 글쓰기
			forward = new ActionForward();
			forward.setPath("/project/projectWrite.jsp");
		} else if(command.equals("/ProjectUpdate.bo")) { // 프로젝트 수정
			forward = new ActionForward();
			forward.setPath("/project/projectUpdate.jsp");
		}  else if(command.equals("/EnterWrite.bo")) { // 채용 글쓰기
			forward = new ActionForward();
			forward.setPath("/enter/enterWrite.jsp");
		} else if(command.equals("/EnterUpdate.bo")) { // 채용 수정
			forward = new ActionForward();
			forward.setPath("/enter/enterUpdate.jsp");
		} else if(command.equals("/EditorWrite.bo")) { //편집자 글쓰기
			forward = new ActionForward();
			forward.setPath("/editor/editorWriteForm.jsp");
		}  else if(command.equals("/EditorUpdate.bo")) { //편집자 수정
			forward = new ActionForward();
			forward.setPath("/editor/editorUpdateForm.jsp");
		} 
//============================== BACK ======================================
		else if(command.equals("/Project.bo")) { // 프로젝트 조회 액션
			action = new ProjectInfoAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/ProjectWritePro.bo")) { // 프로젝트 작성 액션
			action = new ProjectWriteProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/ProjectUpdatePro.bo")) { // 프로젝트 수정 액션
			action = new ProjectUpdateProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/ProjectDeletePro.bo")) { // 프로젝트 삭제 액션
			action = new ProjectDeleteProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/ProjectList.bo")) { // 프로젝트 리스트 액션
			action = new ProjectListAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/ProjectSearchList.bo")) { // 프로젝트 검색 리스트 액션
			action = new ProjectSearchListAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/Enter.bo")) { // 채용공고 조회 액션
			action = new EnterInfoAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EnterWritePro.bo")) { // 채용공고 작성 액션
			action = new EnterWriteProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EnterUpdatePro.bo")) { // 채용공고 수정 액션
			action = new EnterUpdateProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EnterDeletePro.bo")) { // 채용공고 삭제 액션
			action = new EnterDeleteProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EnterList.bo")) { // 채용공고 리스트 액션
			action = new EnterListAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EnterSearchList.bo")) { // 채용공고 검색 리스트 액션
			action = new EnterSearchListAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/Editor.bo")) { // 편집자 조회 액션
			action = new EditorInfoAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EditorWritePro.bo")) { // 편집자 작성 액션
			action = new EditorWriteProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EditorUpdatePro.bo")) { // 편집자 수정 액션
			action = new EditorUpdateProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EditorList.bo")) { // 편집자 리스트 액션
			action = new EditorListAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		} else if(command.equals("/EditorSearchList.bo")) { // 편집자 검색 리스트 액션
			action = new EditorSearchListAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
