package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.jasper.tagplugins.jstl.core.Out;

// DB 관련 기본 기능(연결, 자원반환, commit, rollback 등)을 담당하는 클래스
// => 모든 메서드는 JdbcUtil 클래스의 인스턴스 생성 없이도 접근하도록 
//    static 메서드로 정의
public class JdbcUtil {
	
	// 1. DBCP 를 활용한 Connection 객체를 가져오는 getConnection() 메서드 정의
	// => 파라미터 : 없음, 리턴타입 : java.sql.Connection
	public static Connection getConnection() {
		Connection con = null; // 생성된 Connection 객체를 가져와서 저장할 변수
		
		try {
			// context.xml 파일 내의 <Context> 태그 항목 가져오기
			Context initCtx = new InitialContext();
			// context.xml 파일 내의 <Context> 태그 내에서 <Resource> 태그 항목 가져오기
			// Context 객체의 lookup() 메서드를 호출하여 "java:comp/env" 문자열 전달
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			// context.xml 파일 내의 <Resource> 태그 내에서 
			// JNDI 설정을 위한 이름(name) 속성 가져오기
			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQL");
			// DataSource 객체의 getConnection() 메서드를 호출하여 Connection 객체 가져오기
			con = ds.getConnection(); 
			// JDBC 를 통한 DB 작업에 대한 Auto Commit 기능 해제
			// => 트랜잭션 개념을 적용하기 위함
			con.setAutoCommit(false);
			
		} catch(Exception e) {
			System.out.println("db연결실패"+e.getMessage());
			e.printStackTrace();
		}
		// Connection 객체 리턴
		return con;
		
	}
	// 2. Connection, PreparedStatement, ResultSet 객체 반환하는 close() 메서드 정의
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 3. 트랜잭션 처리를 위한 commit(), rollback() 메서드 정의
	// => Auto Commit 기능이 해제되어 있으므로
	//    작업 성공 시 commit() 메서드에서 Connection 객체의 commit() 메서드를,
	//    작업 실패 시 rollback() 메서드에서 Connection 객체의 rollback() 메서드를 호출
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}