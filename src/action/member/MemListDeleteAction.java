package action.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.MemListDeleteService;
import vo.ActionForward;

public class MemListDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		List<Integer> inerNumList = new ArrayList();
		String[] checkArr=request.getParameterValues("inter_num[]");
		String id = request.getParameter("id");
		for(int i = 0; i<checkArr.length; i++) {
			inerNumList.add(Integer.parseInt(checkArr[i]));
		}
				
		MemListDeleteService memListDeleteService = new MemListDeleteService(); 
		boolean isBookInterDel =  memListDeleteService.dibsDelete(inerNumList,id);
		
		return forward;
	}

}
