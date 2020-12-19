package action.rental;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.rental.RentalInsertService;
import vo.ActionForward;

public class RentalInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RentalInsertAction!");

		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<Integer> rentalAddList = new ArrayList<Integer>();
		String[] checkArr=request.getParameterValues("inter_num[]");
		System.out.println(checkArr);
		for(int i = 0; i<checkArr.length; i++) {
			rentalAddList.add(Integer.parseInt(checkArr[i]));
		}
		RentalInsertService rentalInsertService = new RentalInsertService();
		
		
		
		
		
		return null;
	}

}
