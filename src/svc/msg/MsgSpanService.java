package svc.msg;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MsgDAO;
import vo.MsgBean;

public class MsgSpanService {

	public boolean msgSpan(MsgBean msgBean) {
		System.out.println("MsgSpanService - msgSpan()");
		boolean isSpanSuccess = false; // 글 등록 성공 여부를 저장
		Connection con = getConnection();
		MsgDAO msgDAO = MsgDAO.getInstance();
		msgDAO.setConnection(con);
		int insertCount = msgDAO.insertMsg(msgBean);
		if(insertCount > 0) {
			commit(con); // DB 커밋 작업 수행
			isSpanSuccess = true; // 리턴할 작업 수행 결과를 true 로 설정
		} else {
			rollback(con);
		}
		close(con);
		return isSpanSuccess;
	}

}
