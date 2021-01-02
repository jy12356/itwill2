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
	
	
	public int entireCount(int board_type, int board_num) {
		System.out.println("selectComment");
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from comment where board_type=? and board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_type);
			pstmt.setInt(2, board_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("DAO - entireCount() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
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

//	public int selectMaxSeq() {
//		
//		int maxSeq = 0;
//		
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			
//			String sql2 = "select comment_num from " 
//			
//			
//			String sql = "SELECT max(seq) FROM comment where comment_num = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, comment_num);
//			
//			
//			
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				listCount = rs.getInt(1);
//			}
//			
//			
//			
//			
//		} catch (Exception e) {
//			System.out.println("DAO - selectListCount() 오류! - " + e.getMessage());
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		
//		
//		return maxSeq;
//	}



	public ArrayList<CommentBean> selectCommentList(int page, int limit, int board_type, int board_num) {
		
		ArrayList<CommentBean> commentList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit;
		
		try {
			String sql = "SELECT * FROM comment WHERE board_type=? and board_num=? ORDER BY re_ref DESC,re_seq ASC LIMIT ?,?";
		
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




	public CommentBean selectComment(int board_type, int board_num) {
		System.out.println("selectComment");
		CommentBean cb = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			String sql = "SELECT * FROM comment WHERE board_type=? and board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_type);
			pstmt.setInt(2, board_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cb = new CommentBean();
				cb.setComment_num(rs.getInt("comment_num"));
				cb.setBoard_type(rs.getInt("board_type"));
				cb.setBoard_num(rs.getInt("board_num"));
				cb.setComment_id(rs.getString("comment_id"));
				cb.setComment_desc(rs.getString("comment_desc"));
				cb.setRe_ref(rs.getInt("re_ref"));
				cb.setRe_lev(rs.getInt("re_lev"));
				cb.setRe_seq(rs.getInt("re_seq"));
				cb.setDate(rs.getDate("date"));
			}
			
			
			
			
		} catch (SQLException e) {
			System.out.println("selectComment() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return cb;
	}


	public int insertReplyComment(CommentBean cb) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			int num = 1;
			
			String sql = "SELECT MAX(comment_num) FROM comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			int re_ref = cb.getRe_ref();
			int re_lev = cb.getRe_lev();
			int re_seq = cb.getRe_seq();
			
			sql = "UPDATE comment SET re_seq=re_seq+1 "
					+ "WHERE re_ref=? AND re_seq>?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			pstmt.executeUpdate();
			
			re_lev += 1;
			re_seq += 1;
			
			sql = "INSERT INTO comment VALUES(?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, cb.getBoard_type());
			pstmt.setInt(3, cb.getBoard_num());
			pstmt.setString(4, cb.getComment_id());
			pstmt.setString(5, cb.getComment_desc());
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			insertCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("DAO - insertReplyComment() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
			
			
		return insertCount;
	}




	public int updateComment(CommentBean cb) {
		int updateCount = 0;
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE comment SET comment_desc=? WHERE comment_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cb.getComment_desc());
			pstmt.setInt(2, cb.getComment_num());
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateComment() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("updateCount = " + updateCount);

		return updateCount;
	}



// 일반삭제
//	public int removeComment(int comment_num, int board_type, int board_num) {
//		
//		int deleteCount = 0;
//		
//		PreparedStatement pstmt = null;
//		
//		try {
//			String sql = "DELETE FROM comment WHERE comment_num=? AND board_type=? AND board_num=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, comment_num);
//			pstmt.setInt(2, board_type);
//			pstmt.setInt(3, board_num);
//			deleteCount = pstmt.executeUpdate();
//
//			
//		} catch (SQLException e) {
//			System.out.println("removeComment() 오류!  - " +  e.getMessage());
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return deleteCount;
//	}
	// 흔적남기기
	public int removeComment(int comment_num, int board_type, int board_num) {
	
	int deleteCount = 0;
	
	PreparedStatement pstmt = null;
	
	try {
		String sql = "update comment set comment_id='', comment_desc='삭제된 댓글입니다.' WHERE comment_num=? AND board_type=? AND board_num=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, comment_num);
		pstmt.setInt(2, board_type);
		pstmt.setInt(3, board_num);
		deleteCount = pstmt.executeUpdate();

		
	} catch (SQLException e) {
		System.out.println("removeComment() 오류!  - " +  e.getMessage());
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return deleteCount;
}



//	public int getMaxSeq(int board_num, int board_type, int comment_num) {
//		System.out.println("getMaxSeq");
//		int maxSeq = 0;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			String sql = "select max(re_seq) from comment where board_type=? and board_num=? and comment_num=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, board_type);
//			pstmt.setInt(2, board_num);
//			pstmt.setInt(3, comment_num);
//			
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				maxSeq = rs.getInt(1);
//			}
//			
//		} catch (Exception e) {
//			System.out.println("DAO - entireCount() 오류! - " + e.getMessage());
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		return maxSeq;
//	}







}




























