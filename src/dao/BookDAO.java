package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.BookBean;

import static db.JdbcUtil.*;

public class BookDAO {
	private BookDAO() {}
	private static BookDAO instance = new BookDAO();
	
	public static BookDAO getInstance() {
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	//책등록
	public int insertBook(BookBean bookBean) {
		// Service 클래스로부터 BoardBean 객체를 전달받아
		// DB의 board 테이블에 INSERT 작업 수행하고 결과(int타입)를 리턴
		System.out.println("BoardDAO - insertArticle()");

		int insertCount = 0; // INSERT 작업 수행 결과를 저장할 변수
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1; // 새 글 번호를 저장할 변수
		
		try {
			// 현재 게시물 번호(board_num) 중 가장 큰 번호를 조회하여
			// 해당 번호 + 1 값을 새 글 번호(num)으로 저장
			String sql = "select max(num) from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 조회된 결과가 있을 경우 조회된 번호 + 1 값을 num 에 저장
			// => 조회 결과가 없을 경우 새 글 번호는 1번이므로 기본값 그대로 사용
			if(rs.next()) {
				num = rs.getInt(1) + 1; // 새 글 번호 만들기
			} 
			// 전달받은 BoardBean 객체 내의 데이터를 사용하여 INSERT 작업 수행
			// => 컬럼 중 board_date 항목(작성일)은 now() 함수 사용
			sql = "insert into book "
					+ "(num,title,image,author,publisher,pubdate,isbn,description,catg1,catg2,state,count,author_info,index_info)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// BoardBean 객체로부터 데이터를 꺼내서 쿼리문 ? 대체
			pstmt.setInt(1, num); // 글번호
			pstmt.setString(2, bookBean.getTitle());
			pstmt.setString(3, bookBean.getImage());
			pstmt.setString(4, bookBean.getAuthor());
			pstmt.setString(5, bookBean.getPublisher());
			pstmt.setString(6, bookBean.getPubdate());
			pstmt.setString(7, bookBean.getIsbn());
			pstmt.setString(8, bookBean.getDescription());
			pstmt.setString(9, bookBean.getCatg1());
			pstmt.setString(10, bookBean.getCatg2());
			pstmt.setString(11, "0");
			pstmt.setInt(12, 0);
			pstmt.setString(13, bookBean.getAuthor_info());
			pstmt.setString(14, bookBean.getIndex());
			System.out.println(pstmt);
			// INSERT 구문 실행 결과값을 int형 변수 insertCount 에 저장
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;		
	}

}
