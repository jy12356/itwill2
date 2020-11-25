package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public int selectListCount() {
		System.out.println("ReviewDAO - selectListCount()");
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT count(num) from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectListCount() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}

	public List selectArticleList() {
		System.out.println("ReviewDAO - selectArticleList()");

		List reviewList = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		try {
			String sql = "SELECT * FROM review WHERE num";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				ReviewBean article = new ReviewBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setContent(rs.getString("content"));
				article.setStarcount(rs.getInt("starcount"));
				article.setLikecount(rs.getInt("likecount"));
				article.setIsbn(rs.getString("isbn"));
				article.setSpoiler(rs.getInt("spoiler"));
				reviewList.add(article);
				
				// 확인용
				System.out.println("글 내용 : " + article.getContent());
			}	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectArticleList() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return reviewList;
	}

}
