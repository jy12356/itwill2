<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DBCP 사용을 위한 테스트 Database Connection Pooling기법은 데이터베이스 커넥션 객체를 여러개 만들어서 
	// 커넥션 풀에 넣어놓고 클라이언트 객체가 필요할 때 마다 커넥션(Connection) 객체를 가져다 쓰고
	// 다 쓴 후에는 다시 풀에 돌려주는 기법
	Connection con = null;

	try {
		// JNDI(Java Naming and Directory Interface)외부에서 객체를 가져올 때 쓰는 기술입니다
		// 연결을 위한 설정(대부분의 API 는 javax.naming 패키지에 위치함)
		// context.xml 파일 내의 <Context> 태그 항목 가져오기
		Context initCtx = new InitialContext();
		
		// context.xml 파일 내의 <Context> 태그 내에서 <Resource> 태그 항목 가져오기
		// Context 객체의 lookup() 메서드를 호출하여 "java:comp/env" 문자열 전달
		// => 리턴타입이 Object 타입이므로 Context 타입으로 다운캐스팅 필요
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		
		// context.xml 파일 내의 <Resource> 태그 내에서 
		// JNDI 설정을 위한 이름(name) 속성 가져오기
		// => 리턴타입이 Object 타입이므로 DataSource 타입으로 다운캐스팅 필요
		DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQL");
		
		// DataSource 객체의 getConnection() 메서드를 호출하여 Connection 객체 가져오기
		con = ds.getConnection(); 
		// => ds.getConnection(username, password) 형식으로 사용할 수도 있다!
		
		out.println("<h1>DBCP 연결 성공!</h1>");
	} catch(Exception e) {
		out.println("<h1>DBCP 연결 실패!</h1>");
		e.printStackTrace();
	}

%>


<!-- 얘가 DAO 되는건가 -->














