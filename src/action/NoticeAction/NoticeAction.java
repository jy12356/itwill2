package action.NoticeAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.NoticeActionForward;


public interface NoticeAction {

	
	public NoticeActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception;

}
