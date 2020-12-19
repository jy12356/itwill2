package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentalDAO {
	private RentalDAO() {}

	private static RentalDAO instance = new RentalDAO();

	public static RentalDAO getInstance() {
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertRental(List<Integer> rentalAddList, String id) {
		System.out.println("RentalDAO - insertRental()");
		int insertCount = 0;
		int num = 1;
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    System.out.println("insertRental - 1000");
	    List<String> isbn = new ArrayList<String>(); // 새 글 번호를 저장할 변수
	    
	    System.out.println("insertRental - 0");
	    try {
	    	for(int i=0; i< rentalAddList.size(); i++) {
	         String sql = "select isbn from mybasket where num=? and id=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, rentalAddList.get(i));
			 pstmt.setString(2,id);
	         rs = pstmt.executeQuery();
	         System.out.println("insertRental - 1");
	         if(rs.next()) {
//	        	 isbn = (List<String>) rs.getArray(1);
	        	 isbn = (List<String>) rs.getArray(1);
	         }
	         System.out.println("insertRental - 2");
	    	}
	    	System.out.println("insertRental - 3");
	    	String sql2 = "select max(num) from rental";
	        pstmt = con.prepareStatement(sql2);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	            num = rs.getInt(1) + 1; // 새 글 번호 만들기
	         } 
	        
	    	for(int i=0; i< isbn.size(); i++) {
	    		System.out.println("insertRental - isbn 여기엔 무엇이..?" + isbn);
	    		String sql = "insert into rental (num,isbn,id) values(?,?,?)";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, num); 
	            pstmt.setString(2, isbn.get(i));
	            pstmt.setString(3, id);
	    		
	            System.out.println(pstmt);
	            insertCount = pstmt.executeUpdate();
	            System.out.println("insertcount에는 뭐들어가는거야" + insertCount);
	    	}
	    	int isUpdate = 0;
	    	for(int i=0; i< isbn.size(); i++) {
	    		System.out.println("이것도 한번에 처리 될까?");
	    		String sql = "update book set count=count+1 where isbn =?";
			       pstmt=con.prepareStatement(sql);
			       pstmt.setString(1, isbn.get(i));
			       isUpdate = pstmt.executeUpdate();
	    	}
	    	
	      } catch (SQLException e) {
	         System.out.println("insertBookDibs() 오류! - " + e.getMessage());
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(pstmt);
	      }
	      return insertCount;      
	}
}