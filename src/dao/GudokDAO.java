package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import vo.GudokBean;
import vo.QnaBean;


public class GudokDAO {
	
public GudokDAO() {}
	
	private static GudokDAO instance = new GudokDAO();
	
	public static GudokDAO getInstance() {
		return instance;
	}
	Connection con;
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// 구독 내역 등록
	public int insertArticle(GudokBean gudokBean) {
		System.out.println("GudokDAO - insertArticle");
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		int num = 1;
		String sql = "Select Max(gnum) from gudok";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			sql = "update member set state=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "구독중");
			pstmt.setString(2, gudokBean.getId());
			pstmt.executeUpdate();
			
			sql = "Insert into gudok values(?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, gudokBean.getGproduct());
			pstmt.setString(3, gudokBean.getId());
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}

	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(gnum) from gudok";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("selectListCount() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<GudokBean> selectArticleList(int page, int limit) {
		ArrayList<GudokBean> articleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (page - 1) * limit;
		
		try {
			String sql = "select * from gudok LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			articleList = new ArrayList<GudokBean>();
			while(rs.next()) {
				GudokBean article = new GudokBean();
				article.setGnum(rs.getInt("gnum"));
				article.setGproduct(rs.getString("gproduct"));
				article.setGdate(rs.getDate("gdate"));
				article.setId(rs.getString("id"));
				articleList.add(article);
			}
		} catch (Exception e) {
			System.out.println("selectArticleList() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	
	
}
