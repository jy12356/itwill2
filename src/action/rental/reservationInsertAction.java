package action.rental;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.msg.MsgSpanService;
import svc.rental.RentalInsertService;
import svc.rental.reservationInsertService;
import vo.ActionForward;
import vo.MsgBean;

public class reservationInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalInsertAction!");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		List<Integer> reservationAddList = new ArrayList();

		String[] checkArr = request.getParameterValues("inter_num[]");

		if (id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('로그인을 해주셔야합니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		} else {

			for (int i = 0; i < checkArr.length; i++) {
				reservationAddList.add(Integer.parseInt(checkArr[i]));
			}
			reservationInsertService InsertService = new reservationInsertService();

			boolean isOverlap = InsertService.checkOverlap(reservationAddList, id);

			if (isOverlap == true) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("이미 예약중인 도서가 있습니다."); // 다이얼로그 메세지 출력

				System.out.println("예약 도서가 중복됨");
			} else {
				System.out.println("예약 도서가 중복되지않아");

				boolean isInsertSuccess = InsertService.insertReservation(reservationAddList, id);

				if (!isInsertSuccess) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>"); // 자바스크립트 시작 태그
					out.println("alert('도서예약을 실패하였습니다.')"); // 다이얼로그 메세지 출력
					out.println("history.back()"); // 이전 페이지로 이동
					out.println("</script>"); // 자바스크립트 끝 태그
				} else {
					
					// 예약신청시 메시지 보내기
					MsgBean msgBean = new MsgBean();		
					String fromid = "admin";
					String content = "도서예약신청이 완료되었습니다.";
					msgBean.setId(id);
					msgBean.setFromId(fromid);
					msgBean.setContent(content);
					MsgSpanService msgSpanService = new MsgSpanService();
					boolean isSpan = msgSpanService.msgSpan(msgBean);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
//					out.println("<script>");
//					out.println("alert('도서예약을 성공하였습니다.')");
//					out.println("</script>");
					out.print("예약신청이 완료되었습니다.");
				}

			}

		}

		return null;
	}

}
