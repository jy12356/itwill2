package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.PreparedStatement;

import vo.GudokBean;


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
}
