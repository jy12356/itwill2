package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		/*
		 * System.out.println(isIdCheckSuccess); JSONObject resultObj = new
		 * JSONObject();
		 * 
		 * if (isIdCheckSuccess) { resultObj = new JSONObject();
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter(); String str = "이미 사용중이거나 탈퇴한 회원의 아이디 입니다.";
		 * resultObj.put("result", str ); out.print(str); } String result =
		 * resultObj.get("str").toString();
		 * System.out.println("isIdCheckSuccess : "+isIdCheckSuccess);
		 * System.out.printf("resultObj! : "+resultObj+", id : "+id);
		 */
		System.out.println("MemberListCalAction!333");
		request.setAttribute("responseObj", responseObj);
		System.out.println("MemberListCalAction!444 responseObj.contains(responseObj) : " + responseObj.contains(responseObj));

		System.out.println("MemberListCalAction!555 responseObj : " + responseObj);
		return null;
	}

}
