package action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public class BookReWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookReWriteProAction!");
		
		ActionForward forward = null;
		
		// 현재 컨텍스트(객체) 정보 가져오기 위해  request 객체의 getServletContext() 메서드를 호출
		ServletContext context = request.getServletContext();
		
		
		return forward;
	}

}
