package com.hanjum.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanjum.action.Action;
import com.hanjum.vo.ActionForward;

public class ProjectUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProjectUpdateProAction!");
		ActionForward forward = null;
		
		/*
		 * 	서비스 호출
		 */
		
		/*
		 *  서비스 리턴 값 검사 후 포워딩
		 */
		
		forward = new ActionForward();
		forward.setPath("ProjectContent.bo");
		forward.setRedirect(false);
		return forward;
	}
	
}
