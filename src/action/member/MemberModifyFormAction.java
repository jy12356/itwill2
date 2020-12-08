package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import action.Action;
import svc.MemberModifyFormService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModifyFormAction implements Action {


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("MemberModifyFormAction");
				ActionForward forward = null;
				
				// 원본 게시물 정보 요청에 필요한 글번호(board_num) 파라미터 가져오기
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");
				System.out.println(id);
				// 원본 게시물 정보 요청을 위해 새로운 Service 클래스를 정의하지 않고
				// 기존의 BoardDetailService 클래스의 getArticle() 메서드를 호출하여
				// 원본 게시물 정보 요청을 수행
				// => 파라미터 : 글번호(board_num), 리턴타입 : BoardBean(article)
				MemberModifyFormService memberModifyFormService = new MemberModifyFormService();
				MemberBean article = memberModifyFormService.getArticle(id);
				
				// request 객체에 원본 게시물 정보 (BoardBean) 저장
				request.setAttribute("article", article);
				
				// ActionForward 객체를 생성하여 qna_board_modify.jsp 페이지로 포워딩
				// => Dispatcher 방식
				forward = new ActionForward();
				forward.setPath("/sub1/update.jsp");
				return forward;
	}

}
