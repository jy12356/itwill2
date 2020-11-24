package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.login.LoginException;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import vo.MemberBean;

//import db.JdbcUtil;
import static db.JdbcUtil.*;


public class MemberDAO {
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	// ========================================================================

	Connection con; 

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertMember(MemberBean memberBean) {
		System.out.println("MemberDAO - insertMember()");
		int insertCount = 0; 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1; 
		
		try {
			String sql = "SELECT MAX(num) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1; 
			} 
			
			sql = "INSERT INTO member (num,id,password,email,phone,catg,age,address,name,date) VALUES (?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); 
			pstmt.setString(2,memberBean.getId());
			pstmt.setString(3, memberBean.getPassword());
			pstmt.setString(4, memberBean.getEmail());
			pstmt.setString(5, memberBean.getPhone());
			pstmt.setString(6, memberBean.getCatg());
			pstmt.setInt(7, memberBean.getAge());
			pstmt.setString(8, memberBean.getAddress());
			pstmt.setString(9, memberBean.getName());

			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertMember() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {

			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public boolean isMember(String id, String password) throws LoginException  {
		boolean isMember = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT password,id FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(password.equals(rs.getString("password"))) {
					
					isMember = true;
				} else {
					throw new LoginException("패스워드 틀림");
				}
			} else {
				throw new LoginException("아이디 없음");
			}
			
		} catch (SQLException e) {
			System.out.println("isMember() ERROR! - " + e.getMessage());
			
			e.printStackTrace();
		} finally {
			
			close(rs);
			close(pstmt);
		}
		
		return isMember;
	}

	public int selectListCount() {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			String sql = "SELECT COUNT(board_num) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			

			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("selectListCount() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {

			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}


	public ArrayList<MemberBean> selectArticleList(int page, int limit) {
		ArrayList<MemberBean> articleList = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		int startRow = (page - 1) * limit;
		
		try {
			String sql = "SELECT * FROM member LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			articleList = new ArrayList<MemberBean>();
			
			while(rs.next()) {
				MemberBean article = new MemberBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setPassword(rs.getString("password"));
				article.setEmail(rs.getString("email"));
				article.setPhone(rs.getString("phone"));
				article.setCatg(rs.getString("catg"));
				article.setAge(rs.getInt("age"));
				article.setAddress(rs.getString("address"));
				article.setDate(rs.getTimestamp("date"));
				article.setName(rs.getString("name"));
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("selectArticleList() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return articleList;
	}
	public MemberBean selectArticle(int id) {
		MemberBean article = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from board where id=?";
		
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				article = new MemberBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setPassword(rs.getString("password"));
				article.setEmail(rs.getString("email"));
				article.setPhone(rs.getString("phone"));
				article.setCatg(rs.getString("catg"));
				article.setAge(rs.getInt("age"));
				article.setAddress(rs.getString("address"));
				article.setDate(rs.getTimestamp("date"));
				article.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			System.out.println("selectArticle() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		System.out.println("�븘�씠�뵒 : "+article.getId());
		
		
		return article;
	}

		

		public int updateArticle(MemberBean article) {
			int updateCount = 0;
			
			PreparedStatement pstmt = null;
			try {
				String sql = "UPDATE board SET name=?, email=?, phone=?, catg=?, age=?, address=? WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, article.getName());
				pstmt.setString(2, article.getEmail());
				pstmt.setString(3, article.getPhone());
				pstmt.setString(4, article.getCatg());
				pstmt.setInt(5, article.getAge());
				pstmt.setString(6, article.getAddress());
				pstmt.setString(7, article.getId());
				updateCount = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("updateArticle() ERROR! - " + e.getMessage());
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}
		
		public int deleteArticle(MemberBean article) {
			int updateCount = 0;
			
			PreparedStatement pstmt = null;
			try {
				String sql = "delete from member WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, article.getId());
				updateCount = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("deleteArticle() 오류! - " + e.getMessage());
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
		return updateCount;
	}
		public int deleteMember(String id) {
			System.out.println("MemberDAO : deleteMember()");
			int deleteCount = 0;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "DELETE FROM member WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				System.out.println(pstmt);
				deleteCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("deleteMember() 오류! "+ e.getMessage());
				e.printStackTrace();
			} finally {
				close(pstmt);
				
			}
			
			
			return deleteCount;
		}
		
	}
