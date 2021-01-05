package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import svc.MemberCheckService;
import svc.MemberListCalService;
import vo.ActionForward;

public class MemberListCalAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberListCalAction!111");
		ActionForward forward = null;
		MemberListCalService memberListCalService = new MemberListCalService();
		System.out.println("MemberListCalAction!222");
		JSONArray responseObj = memberListCalService.MemberListcheck();
		System.out.println("MemberListCalAction!333");
		/* request.setAttribute("responseObj", responseObj); */
		System.out.println("MemberListCalAction!555 responseObj : " + responseObj);
		
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(responseObj);
		return forward;
	}

}
