package svc;

import static db.JdbcUtil.close;

import java.sql.Connection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.MemberDAO;
import db.JdbcUtil;

public class MemberListCalService {
	public JSONArray  MemberListcheck() {
		System.out.println("MemberListCalService - MemberListcheck()시작");
		Connection con = JdbcUtil.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		System.out.println("MemberListCalService - MemberDAO.getInstance()222");
		memberDAO.setConnection(con);
		System.out.println("MemberListCalService - MemberListcheck()333");
		JSONArray responseObj = new JSONArray();
		responseObj = memberDAO.memberListCal();
		close(con);
		System.out.println("MemberListCalService - MemberListcheck() 종료");
		return responseObj;
	}

}
