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
	
	// 전체 게시물 수 조회
	public int selectListCount() {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(board_num) FROM board";
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

	public ArrayList<RequestBean> selectArticleList(int page, int limit) {
				ArrayList<RequestBean> articleList = null;
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				int startRow = (page - 1) * limit;
				
				try {
					String sql = "SELECT * FROM board ORDER BY board_re_ref DESC,board_re_seq ASC LIMIT ?,?";
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

}
