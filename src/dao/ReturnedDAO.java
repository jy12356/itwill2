package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import vo.GudokBean;
import vo.ReturnedBean;

public class ReturnedDAO {

public ReturnedDAO() {}
	
	private static ReturnedDAO instance = new ReturnedDAO();
	
	public static ReturnedDAO getInstance() {
		return instance;
	}
	Connection con;
	public void setConnection(Connection con) {
		this.con = con;
		
// 반납 컬럽 등록		
	}
	public int insertArticle(ReturnedBean returnedBean) {
		System.out.println("ReturnedDAO - insertArticle()");
		int insertCount = 0;
//		String isbn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 1;
		
		String sql = "select max(num) from returned";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} 
			sql = "insert into returned values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setNString(2, returnedBean.getIsbn());
			pstmt.setNString(3, returnedBean.getId());
			pstmt.setNString(4, returnedBean.getState());
			pstmt.setNString(5, returnedBean.getS_date());
			pstmt.setNString(6, returnedBean.getOnrental_date());
			pstmt.setNString(7, returnedBean.getE_date());
			pstmt.setNString(8, returnedBean.getTitle());
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
	
	// 반납리스트
	public int selectListCount() {
		System.out.println("ReturnedDAO - selectListCount()");
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from returned";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
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
	public ArrayList<ReturnedBean> selectReturnedList(int page, int limit) {
		System.out.println("ReturnedDAO - selectRentalList()");
		
		 ArrayList<ReturnedBean> articleList = null;
		 PreparedStatement pstmt = null;
			ResultSet rs = null;

			// 조회를 시작할 레코드(행) 번호 계산
			int startRow = (page - 1) * limit;
			
			try {
				String sql = "select * from returned LIMIT ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, limit);
				rs = pstmt.executeQuery();
				
				articleList = new ArrayList<ReturnedBean>();
				while(rs.next()) {
				ReturnedBean article = new ReturnedBean();
				article.setNum(rs.getInt("num"));
				article.setIsbn(rs.getString("isbn"));
				article.setId(rs.getString("id"));
				article.setState(rs.getString("state"));
				article.setS_date(rs.getString("s_date"));
				article.setOnrental_date(rs.getString("onrental_date"));
				article.setE_date(rs.getString("e_date"));
				article.setTitle(rs.getString("title"));
				articleList.add(article);
				}
			} catch (Exception e) {
				System.out.println("selectReturnedList() 오류! - " + e.getMessage());
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
		return articleList;
	}
	
	// 삭제
	
	public int rentalDelete(List<Integer> inerNumList, String id) {
		System.out.println("rentalDelete - rentalDelete");
	      int isDeleteOk = 0;
	      PreparedStatement pstmt = null;
	      
try {

	         for(int i=0; i< inerNumList.size(); i++) {
	            String sql = "delete from returned where num=? and id=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, inerNumList.get(i));
	            pstmt.setString(2,id);
	            System.out.println(pstmt);
	            isDeleteOk = pstmt.executeUpdate();
	         }
	      }catch (Exception e) {
	         System.out.println("rentalDelete 오류!" + e.getMessage());
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return isDeleteOk;
	}
	
}
