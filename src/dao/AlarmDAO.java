package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AlarmBean;
import vo.RequestBean;

import static db.JdbcUtil.*;

public class AlarmDAO {

	private static AlarmDAO instance = new AlarmDAO();

	private AlarmDAO() {
	}

	public static AlarmDAO getInstance() {
		return instance;
	}
	// ========================================================================

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 알림 등록 작업
	

	// 전체 알림 조회
	public int selectListCount(String id) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(num) FROM message WHERE id=? AND state=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, "n");
			rs = pstmt.executeQuery();

			if (rs.next()) {
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
	public ArrayList<AlarmBean> selectArticleList(int page, int limit) {
		ArrayList<AlarmBean> articleList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int startRow = (page - 1) * limit;

		try {
			String sql = "SELECT * FROM bookreq ORDER BY date ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			articleList = new ArrayList<AlarmBean>();

			while (rs.next()) {
				AlarmBean article = new AlarmBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setContent(rs.getString("content"));
				article.setRead(rs.getString("read"));
				article.setDate(rs.getDate("date"));
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

}
