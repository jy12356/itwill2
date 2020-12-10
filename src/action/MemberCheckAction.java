package action;
import org.json.simple.*;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberCheckService;
import vo.ActionForward;

public class MemberCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberCheckAction!");

		ActionForward forward = null;
		String id = request.getParameter("id");
		System.out.println("MemberCheckAction id : "+id);
		MemberCheckService memberCheckService = new MemberCheckService();
//		String data = null; 
		boolean isIdCheckSuccess = memberCheckService.registArticle(id);
		System.out.println(isIdCheckSuccess);
		JSONObject resultObj = new JSONObject();
		if (!isIdCheckSuccess) {
			resultObj = new JSONObject();
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        String str =  "���� ���̵�׿�!";
//	        String resultObj = "[{\"keyword\":\""+str+"\"}]";
	        resultObj.put("result", id );
	        out.print(resultObj);
		} else {
			resultObj = new JSONObject();
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        String str =  "�̹� ������̰ų� Ż���� ȸ���� ���̵� �Դϴ�.";
//	        String resultObj = "[{\"keyword\":\""+str+"\"}]";
	        resultObj.put("result", id );
	        out.print(resultObj);
		}
		System.out.println("���⺸����! : "+resultObj);
		return null;
	}

}
