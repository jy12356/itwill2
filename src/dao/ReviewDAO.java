package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.ReviewBean;

import static db.JdbcUtil.*;

public class ReviewDAO {
	
	public ReviewDAO() {}
	
	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		System.out.println("ReviewDAO - 1. getInstance()");
				
		return instance;
	}
		
	Connection con;
	
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아 멤버변수에 저장하는 setConnection() 메서드 정의
	public void setConnection(Connection con) {
		System.out.println("ReviewDAO - 2. setConnection()");
		
		this.con = con;
	}
	
	// 리뷰 등록 --------------------------------------------------------
	public int insertArticle(ReviewBean reviewBean) {
		System.out.println("ReviewDAO - 3. insertArticle()");
		
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

	// 리뷰등록 수 -------------------------------------------------------
	public int selectListCount() {
		System.out.println("ReviewDAO - 4. selectListCount()");
		
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
	
	// 리뷰리스트 ---------------------------------------------------------
	public ArrayList<ReviewBean> selectArticleList(int page, int limit) {
		System.out.println("ReviewDAO - 5. selectArticleList()");
		
		ArrayList<ReviewBean> articleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 조회를 시작할 레코드(행) 번호 계산
		int startRow = (page - 1) * limit;
		
		try {
			// 게시물 조회
			// 리뷰번호(num)을 기준으로 내림차순 정렬
			// 조회 시작 게시물 번호(StarRow)를 기준으로 limit 갯수만큼 조회
			String sql = "SELECT * FROM review ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			// ArrayList 객체 생성
			articleList = new ArrayList<ReviewBean>();
			
			// 읽어올 게시물이 존재할 경우 다음 작업 반복
			// => ReviewBean 객체를 생성하여 레코드 데이터 모두 저장 후
			//    ReviewBean 객체를 다시 ArrayList 객체에 추가
			while(rs.next()) {
				ReviewBean article = new ReviewBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setContent(rs.getString("content"));
				article.setDate(rs.getDate("date"));
				article.setStarcount(rs.getInt("starcount"));
				article.setLikecount(rs.getInt("likecount"));
				article.setIsbn(rs.getString("isbn"));
				article.setSpoiler(rs.getInt("spoiler"));
				
				// 레코드 저장 확인용 코드
				System.out.println("제목 : " + article.getContent());

				// 1개 게시물을 전체 게시물 저장 객체(ArrayList)에 추가
				articleList.add(article);
			}		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectArticleList() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return articleList;
	}
	
	// 글 작성자 복인 확인 -------------------------------------------------
	public boolean isArticleReviewWriter(int num, String id) {
		System.out.println("ReviewDAO - 6. isArticleReviewWriter()");
		
		boolean isArticleWriter = false;
		
		// board_num에 해당하는 레코드의 board_pass를 가져와서
		// 파라미터로 전달받은 board_pass와 비교하여 일치 여부
		// => 만약, 패스워드 일치하는 경우 isArticleWriter를 true로 변경
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id FROM review WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			System.out.println("2.글번호 :" + num);
			System.out.println("2.작성자 :" + id);
			if(rs.next()) {
				if(id.equals(rs.getString("id"))) {
					isArticleWriter = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isArticleReviewWriter() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return isArticleWriter;
	}
	// 글 삭제 -------------------------------------------------
	public int deleteArticle(int num) {
		System.out.println("ReviewDAO - 7. deleteArticle()");
		
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM review WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			System.out.println("4.글번호 :" + num);

			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteArticle() 오류! - " + e.getMessage());
		} finally {

			close(pstmt);
		}
		return deleteCount;
	}

}
