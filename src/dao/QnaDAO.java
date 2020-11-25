package dao;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.QnaBean;

import static db.JdbcUtil.*;

public class QnaDAO {
	
	private QnaDAO() {}
	
	private static QnaDAO instance = new QnaDAO();
	
	public static QnaDAO getInstance() {
		return instance;
	}
	Connection con;
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// 글 등록 작업
	public int insertArticle(QnaBean qnaBean) {
		System.out.println("QnaDAO- insertArticle");
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		
		int num = 1;
		String sql = "Select Max(board_num) from qna";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1; // 새 글 번호 만들기
			}
			sql = "Insert into qna values(?,?,?,?,?,?,now(),?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qnaBean.getId());
			pstmt.setString(3, qnaBean.getPass());
			pstmt.setString(4, qnaBean.getTitle());
			pstmt.setString(5, qnaBean.getContent());
			pstmt.setString(6, qnaBean.getQna_genre());
			pstmt.setInt(7, num); // 참조글 번호(새글이므로 자신이 참조)
			pstmt.setInt(8, qnaBean.getRe_lev());
			pstmt.setInt(9, qnaBean.getRe_seq());
			pstmt.setString(10, qnaBean.getContent2());
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}
	
	//전체 게시물 수 조회
	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "Select count(board_num) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("selectListCount() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	// 게시물 목록 조회
	public ArrayList<QnaBean> selectArticleList(int page, int limit) {

		ArrayList<QnaBean> articleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit;
		
		try {
			String sql = "SELECT * FROM qna "
					+ "ORDER BY re_ref DESC,re_seq ASC "
					+ "LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			// ArrayList 객체 생성(while문 위에서 생성 필수!)
			articleList = new ArrayList<QnaBean>();
			while(rs.next()) {
				QnaBean article = new QnaBean();
				article.setBoard_num(rs.getInt("board_num"));
				article.setId(rs.getString("id"));
				article.setPass(rs.getString("pass"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setQna_genre(rs.getString("qna_genre"));
				article.setRe_ref(rs.getInt("re_ref"));
				article.setRe_lev(rs.getInt("re_lev"));
				article.setRe_seq(rs.getInt("re_seq"));
				article.setDate(rs.getDate("date"));
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("selectArticleList() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	
	// 게시물 상세 내용 조회
	public QnaBean selectArticle(int board_num) {
		
		QnaBean article = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from qna where board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new QnaBean();
				article.setBoard_num(rs.getInt("board_num"));
				article.setId(rs.getString("id"));
				article.setQna_genre(rs.getString("qna_genre"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setRe_ref(rs.getInt("re_ref"));
				article.setRe_lev(rs.getInt("re_lev"));
				article.setRe_seq(rs.getInt("re_seq"));
				article.setDate(rs.getDate("date"));
				article.setContent2(rs.getString("content2"));
				System.out.println("글 제목 : " + article.getTitle());
			}
		} catch (SQLException e) {
			System.out.println("selectArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return article;
	}
	
	// 글 수정
	public  int updateArticle(QnaBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		try {
		String sql = "update qna set qna_genre=?,title=?,content=? where board_num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, article.getQna_genre());
		pstmt.setString(2, article.getTitle());
		pstmt.setString(3, article.getContent());
		pstmt.setInt(4, article.getBoard_num());
		updateCount = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("updateArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	//글 삭제
	public int deleteArticle(int board_num) {
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		System.out.println("board_num = " + board_num);
		try {
			String sql = "DELETE FROM qna WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	// 답글 등록
	public int insertReplyArticle(QnaBean article) {
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1;
		try {
			String sql = "select max(board_num) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1) + 1;
				
				int re_ref = article.getRe_ref(); // 기존글 참조번호
				int re_lev = article.getRe_lev(); // 기존글 들여쓰기 값
				int re_seq = article.getRe_seq(); // 기존글 순서번호	
				
				sql = "update qna set re_seq=re_seq+1 where re_ref=? and re_seq>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, re_ref);
				pstmt.setInt(2, re_seq);
				pstmt.executeUpdate();
				
				re_lev += 1;
				re_seq += 1;
				System.out.println(article.getRe_lev());
				System.out.println(article.getRe_seq());
				System.out.println(article.getTitle());
				sql = "insert into qna values(?,?,?,?,?,?,now(),?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, article.getId());
				pstmt.setString(3, article.getPass());
				pstmt.setString(4, article.getTitle());
				pstmt.setString(5, article.getContent());
				pstmt.setString(6, article.getQna_genre());
				pstmt.setInt(7, article.getRe_ref());
				pstmt.setInt(8, article.getRe_lev());
				pstmt.setInt(9, article.getRe_seq());
				pstmt.setString(10, article.getContent2());
				insertCount = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			System.out.println("insertReplyArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}
	
	
}
