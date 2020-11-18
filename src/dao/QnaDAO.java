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
		
		int num = 0;
		
		String sql = "Select Max(board_num) from qna";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1; // 새 글 번호 만들기
			}
			sql = "Insert into qna values(?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qnaBean.getId());
			pstmt.setString(3, qnaBean.getPass());
			pstmt.setString(4, qnaBean.getTitle());
			pstmt.setString(5, qnaBean.getContent());
//			pstmt.setString(6, qnaBean.getComment());
			pstmt.setString(7, qnaBean.getQna_genre());
			pstmt.setInt(8, num);
			
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
		
		String sql = "SELECT * FROM board "
				+ "ORDER BY date DESC,board_re_seq ASC "
				+ "LIMIT ?,?";
		
		return articleList;
	}
	
	
}
