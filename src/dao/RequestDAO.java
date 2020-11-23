package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.RequestBean;

import static db.JdbcUtil.*;

public class RequestDAO {
	
	private static RequestDAO instance = new RequestDAO();
	
	private RequestDAO() {}
	
	public static RequestDAO getInstance() {
		return instance;
	}
	// ========================================================================
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// 글 등록 작업
	public int insertArticle(RequestBean requestBean) {
		System.out.println("BoardDAO - insertArticle()");
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1;
		
		try {
			String sql = "SELECT MAX(num) FROM bookreq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO bookreq VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, requestBean.getId());
			pstmt.setString(3, requestBean.getSubject());
			pstmt.setString(4, requestBean.getAuthor());
			pstmt.setString(5, requestBean.getPublisher());
			pstmt.setString(6, requestBean.getPubdate());
			pstmt.setString(7, requestBean.getIsbn());
			pstmt.setString(8, requestBean.getContent());
			pstmt.setString(9, requestBean.getFile());
			pstmt.setInt(10, num);
			pstmt.setInt(11, requestBean.getRe_lev());
			pstmt.setInt(12, requestBean.getRe_seq());
			
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
	
	// 전체 게시물 수 조회
	public int selectListCount() {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(num) FROM bookreq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("selectListCount() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 게시물 목록 조회
	public ArrayList<RequestBean> selectArticleList(int page, int limit) {
				ArrayList<RequestBean> articleList = null;
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				int startRow = (page - 1) * limit;
				
				try {
					String sql = "SELECT * FROM bookreq ORDER BY re_ref DESC,re_seq ASC LIMIT ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, limit);
					rs = pstmt.executeQuery();
					
					articleList = new ArrayList<RequestBean>();

					while(rs.next()) {
						RequestBean article = new RequestBean();
						article.setNum(rs.getInt("num"));

						articleList.add(article);
					}
					
				} catch (SQLException e) {
					System.out.println("selectArticleList() 오류! - " + e.getMessage());
					e.printStackTrace();
				} finally {
					close(rs);
					close(pstmt);
				}
				
				return articleList;
	}
	
	// 게시물 상세내용 조회
	public RequestBean selectArticle(int num) {
		
		RequestBean article = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM bookreq WHERE num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			// 게시물이 존재할 경우 BoardBean 객체를 생성하여 게시물 내용 저장
			if(rs.next()) {
				article = new RequestBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setSubject(rs.getString("subject"));
				article.setAuthor(rs.getString("author"));
				article.setSubject(rs.getString("publisher"));
				article.setSubject(rs.getString("pubdate"));
				article.setContent(rs.getString("content"));
				article.setFile(rs.getString("file"));
				article.setIsbn(rs.getString("isbn"));
				article.setRe_ref(rs.getInt("re_ref"));
				article.setRe_lev(rs.getInt("re_lev"));
				article.setRe_seq(rs.getInt("re_seq"));
				article.setDate(rs.getDate("date"));
				
				// 임시 확인용 상세 내용 출력
//				System.out.println("글 제목 : " + article.getBoard_subject());
			}
				
			
		} catch (SQLException e) {
			System.out.println("selectArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return article;
		
	}
	
	// 본인 확인
	public boolean isArticleRequestWriter(int num, String pass) {
		boolean isArticleWriter = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT pass FROM bookreq WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("pass"))) {
					isArticleWriter = true;
				}
			}
			
		} catch (SQLException e) {
			System.out.println("isArticleRequestWriter() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isArticleWriter;
	}

	// 글 수정
	public int updateArticle(RequestBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE bookreq SET subject=?,author=?,publisher=?,pubdate=?,isbn=?,content=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());
			pstmt.setString(2, article.getAuthor());
			pstmt.setString(3, article.getPublisher());
			pstmt.setString(4, article.getPubdate());
			pstmt.setString(5, article.getIsbn());
			pstmt.setString(6, article.getContent());
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("updateArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

}
