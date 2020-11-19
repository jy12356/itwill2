package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberDeleteFormAction;
import action.MemberListAction;
import action.MemberModifyFormAction;
import action.MemberWriteProAction;
import vo.ActionForward;

@WebServlet("*.bo") // ���� �ּ� �� XXX.bo �ּҿ� ���� ��û�� ���޹޾� ó��
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���� ��û �� GET ��� �Ǵ� POST ����� ��û�� ������ 
		// �������� ó���ϱ� ���� doGet(), doPost() �޼��忡�� ȣ���ϴ� �޼���
		// => �Ķ���ͷ� request ��ü�� response ��ü�� ���޹���
		
		// POST ��� ��û�� ���� �ѱ� ó��
		request.setCharacterEncoding("UTF-8");
		
		// ���� �ּ� ��������
		String command = request.getServletPath();
		System.out.println("��û ���� �ּ� : " + command);
		
		// �� ��û ó���� �ʿ��� ��ü�� �ٷ�� ���� ����
		Action action = null;
		ActionForward forward = null;
		
		// if���� ����Ͽ� �� ���� �ּ� �Ǻ� �� �� ��û ó���� ���� �۾� ��û
		if(command.equals("/MemberWriteForm.bo")) {
			/*
			 * �۾��� �������� ���� ��û�� ����Ͻ� ���� ����
			 * View ������(JSP)�� �ٷ� ������ ����
			 * - ���� ���� �ּҰ� �����Ǿ�� �ϹǷ� Dispatcher ��� ������
			 *   => ActionForward ��ü�� redirect �������� false �� ����
			 *      (boolean Ÿ�� �⺻ ���� false �̹Ƿ� ���� ���� �ʿ� ����)\
			 *   => ����, ������ �ּҸ� ����
			 * - ������ �ּ� : board ���� ���� qna_board_write.jsp
			 */
			// 1. ActionForward ��ü ����(������ �̹� ����Ǿ� ����)
			forward = new ActionForward();
			// 2. ������ ��� ����
			forward.setPath("/sub1/join.jsp");
			// 3. ������ ��� ����(Dispatcher ���)
//			forward.setRedirect(false); // �⺻���� false �̹Ƿ� ���� ���� ����
		} else if(command.equals("/MemberWritePro.bo")) { // BoardWritePro.bo ���� ��û�� ���� ó��
			// 1. BoardWriteProAction Ŭ���� ��ü ����
			// => Action Ŭ������ Action �������̽��� �����ϹǷ� ������ Ȱ�� ����
			action = new MemberWriteProAction();
			
			try {
				// 2. Action Ŭ������ execute() �޼��� ȣ��
				// => ���ϵǴ� ActionForward ��ü ���޹ޱ�(���� �������� ����!)
				// => throws �� ���� ���ܰ� ���޵ǹǷ� try ~ catch �ʿ�
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/MemberList.bo")) {
			
			System.out.println("MemberList.bo �� ������!");
			
			action = new MemberListAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(command.equals("/MemberModifyForm.bo")) {
			
			System.out.println("MemberModifyForm");
			
			action = new MemberModifyFormAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if(command.equals("/MemberDeleteForm.bo")) {
			
			System.out.println("MemberDeleteForm");
			
			action = new MemberDeleteFormAction();
			try {
				forward = new ActionForward();
				forward.setPath("/sub1/delete.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		// ----------------------------------------------------------------
		// �⺻���� �۾� �� ���������� ������ ������ �۾�
		// 1. ActionForward ��ü ���� ���� �Ǻ�(��ü�� ������ �� ������ ����)
		if(forward != null) {
			// 2. ActionForward ��ü ���� ������ ��Ŀ� ���� ������ ������ ����
			// => Redirect ��� : isRedirect() == true, 
			//    Dispatcher ��� : isRedirect() == false
			if(forward.isRedirect()) {
				// 3. Redirect ����� ��� 
				// response ��ü�� sendRedirect() �޼��带 ȣ���Ͽ� ������
				// => �Ķ���� : ������ �� URL
				response.sendRedirect(forward.getPath());
			} else { 
				// 4. Dispatcher ����� ���
				// 4-1. request ��ü�� getRequestDispatcher() �޼��带 ȣ���Ͽ�
				//      RequestDispatcher ��ü�� ���Ϲޱ�
				//      => �Ķ���� : ������ �� URL
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher(forward.getPath());
				// 4-2. RequestDispatcher ��ü�� forward() �޼��带 ȣ���Ͽ�
				//      ������ ����(�Ķ���� : request, response ��ü)
				dispatcher.forward(request, response);
			}
			// ----------------------------------------------------------------
		
		}
		
	}   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���� ��û �� GET ��� ��û�� ������ �ڵ����� ȣ��Ǵ� �޼���
		// => �Ķ���ͷ� request ��ü�� response ��ü�� ���޹���
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���� ��û �� POST ��� ��û�� ������ �ڵ����� ȣ��Ǵ� �޼���
		// => �Ķ���ͷ� request ��ü�� response ��ü�� ���޹���
		doProcess(request, response);
	}

}
 