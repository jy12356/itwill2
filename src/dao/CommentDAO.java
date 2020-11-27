package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CommentBean;

import static db.JdbcUtil.*;

public class CommentDAO {

	private CommentDAO() {}
	
	private static CommentDAO instance = new CommentDAO();
	
	public static CommentDAO getInstance() {
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	
	
	public int selectListCount() {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(comment_num) FROM comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("DAO - selectListCount() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return listCount;
	}




	public ArrayList<CommentBean> selectCommentList(int page, int limit, int board_type, int board_num) {
		
		ArrayList<CommentBean> commentList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit;
		
		try {
			String sql = "SELECT * FROM comment WHERE board_type=? and board_num=? ORDER BY comment_num desc LIMIT ?,?";
		
			pstmt = con.prepareStatement(sql);
			CommentBean commentBean = new CommentBean();
			pstmt.setInt(1, board_type);
			pstmt.setInt(2, board_num);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, limit);
			rs = pstmt.executeQuery();
			
			commentList = new ArrayList<CommentBean>();
			
			while(rs.next()) {
				commentBean = new CommentBean();
				commentBean.setComment_num(rs.getInt("comment_num"));
				commentBean.setBoard_type(rs.getInt("board_type"));
				commentBean.setBoard_num(rs.getInt("board_num"));
				commentBean.setComment_id(rs.getString("comment_id"));
				commentBean.setComment_desc(rs.getString("comment_desc"));
				commentBean.setRe_ref(rs.getInt("re_ref"));
				commentBean.setRe_lev(rs.getInt("re_lev"));
				commentBean.setRe_seq(rs.getInt("re_seq"));
				commentBean.setDate(rs.getDate("date"));
				
				commentList.add(commentBean);
			}
			
		} catch (SQLException e) {
			System.out.println("selectCommentList() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		
		
		
		return commentList;
	}

}




























