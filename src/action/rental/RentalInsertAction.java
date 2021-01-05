package action.rental;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.Mybasket.MyBasketInsertService;
import svc.alarm.AlarmListService;
import svc.msg.MsgSpanService;
import svc.rental.RentalInsertService;
import vo.ActionForward;
import vo.MsgBean;

public class RentalInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalInsertAction!");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		List<Integer> rentalAddList = new ArrayList();
		String[] checkArr = request.getParameterValues("inter_num[]");

		if (id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('로그인을 해주셔야합니다.')"); // 다이얼로그 메세지 출력
			out.println("history.back()"); // 이전 페이지로 이동
			out.println("</script>"); // 자바스크립트 끝 태그
		} else {
			System.out.println("순서 1");
			for (int i = 0; i < checkArr.length; i++) {
				rentalAddList.add(Integer.parseInt(checkArr[i]));
			}
			RentalInsertService rentalInsertService = new RentalInsertService();
			System.out.println("순서 2");

			boolean isOverlap = rentalInsertService.checkOverlap(rentalAddList, id);
			System.out.println("순서 3");

			if (isOverlap == true) {
				System.out.println("순서 4");

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
//				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("이미 대여중인 도서가 있습니다."); // 다이얼로그 메세지 출력
//				out.println("history.back()"); // 이전 페이지로 이동
//				out.println("</script>"); // 자바스크립트 끝 태그
				
				System.out.println("대여 도서가 중복됨");
			} else {
				System.out.println("순서 5");

				System.out.println("도서가 중복되지않아");
				boolean isInsertSuccess = rentalInsertService.insertRental(rentalAddList, id);

				if (!isInsertSuccess) {
					System.out.println("순서 6");

					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
//					out.println("<script>"); // 자바스크립트 시작 태그
					out.println("도서는 최대 5권 까지 대여 가능합니다."); // 다이얼로그 메세지 출력
//					out.println("history.back()"); // 이전 페이지로 이동
//					out.println("</script>"); // 자바스크립트 끝 태그
				} else {
					System.out.println("순서 7");
					
					AlarmListService alarmlistservice = new AlarmListService();
					int messageCount = alarmlistservice.listCount(id);
					System.out.println("messageCount" + messageCount);
					session.setAttribute("messageCount", messageCount);
					
					// 대출신청시 메시지 보내기
					MsgBean msgBean = new MsgBean();		
					String fromid = "admin";
					String content = "대여신청이 완료되었습니다.";
					msgBean.setId(id);
					msgBean.setFromId(fromid);
					msgBean.setContent(content);
					MsgSpanService msgSpanService = new MsgSpanService();
					boolean isSpan = msgSpanService.msgSpan(msgBean);
					

					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
//					out.println("<script>");
//					out.println("alert('도서대여 신청을 성공하였습니다.')");
//					out.println("</script>");
					out.print("대여신청이 완료되었습니다.");
				}

			}
		}
		return null;
	}

}
