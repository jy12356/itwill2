package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.ReviewBean;

import static db.JdbcUtil.*;

public class ReviewDAO {
	
	public ReviewDAO() {}
	
	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		System.out.println("ReviewDAO - getInstance()");
				
		return instance;
	}
		
	Connection con;
	
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아 멤버변수에 저장하는 setConnection() 메서드 정의
	public void setConnection(Connection con) {
		System.out.println("ReviewDAO - setConnection()");
		
		this.con = con;
	}
	
	// 리뷰 등록
	public int insertArticle(ReviewBean reviewBean) {
		System.out.println("ReviewDAO - insertArticle()");
		
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1;
		
		try {
			String sql = "SELECT MAX(num) FROM review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			sql = "INSERT INTO review values(?,?,?,now(),?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, reviewBean.getId());
			pstmt.setString(3, reviewBean.getContent());
			pstmt.setInt(4, reviewBean.getStarcount());
			pstmt.setInt(5, reviewBean.getLikecount());
			pstmt.setString(6, reviewBean.getIsbn());
			pstmt.setInt(7, reviewBean.getSpoiler());
			
			insertCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return insertCount;
	}

}
