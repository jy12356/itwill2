package action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import action.Action;
import svc.MemberCheckService;
import vo.ActionForward;

public class MemNameListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberCheckAction!");

		ActionForward forward = null;
		String id = request.getParameter("id");
		System.out.println("MemNameListAction id : "+id);
		MemberCheckService memberCheckService = new MemberCheckService();
//		String data = null; 
		boolean isIdCheckSuccess = memberCheckService.registArticle(id);
		System.out.println(isIdCheckSuccess);
		JSONObject resultObj = new JSONObject();

		if (isIdCheckSuccess) {
			 resultObj = new JSONObject();
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        String str =  "이미 사용중이거나 탈퇴한 회원의 아이디 입니다.";
	        resultObj.put("result", str );
	        out.print(str);
		} 
		String result = resultObj.get("str").toString();
		System.out.println("isIdCheckSuccess : "+isIdCheckSuccess);
		System.out.printf("resultObj! : "+resultObj+", id : "+id);
		return null;
	}

}
