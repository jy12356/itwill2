package action.gudok;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import svc.gudok.ChargeProService;
import vo.ActionForward;
import vo.GudokBean;

public class ChargeProAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ChargeProAction!!");
		ActionForward forward = null;
		
		String gproduct = request.getParameter("gproduct");
		
		GudokBean gudokBean = new GudokBean();
		gudokBean.setId("id");
		gudokBean.setGproduct(gproduct);
		
		ChargeProService chargeProService = new ChargeProService();
		boolean isWriteSuccess = chargeProService.registArticle(gudokBean);
		
		if(!isWriteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구매 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("sub5/Charge2.jsp");
			forward.setRedirect(true);
		}
		return forward;
}
}

