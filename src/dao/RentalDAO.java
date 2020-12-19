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
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
	    System.out.println("insertRental - 1000");
	    List<String> isbn =null; // 새 글 번호를 저장할 변수

	    System.out.println("insertRental - 0");
	    System.out.println("ididididididi: "+id);
	    try {
	    	for(int i=0; i< rentalAddList.size(); i++) {
			    int num1 = rentalAddList.get(i);
			    System.out.println("515151515151 : "+rentalAddList.get(i));	
			    System.out.println("numnumnum11111 : "+num1);	
			    String sql = "select isbn from mybasket where num=? and id=?";
		         pstmt = con.prepareStatement(sql);	
		         System.out.println("insertRental - 1-1");
		         pstmt.setInt(1, num1);	
		         System.out.println("insertRental - 1-1");
				 pstmt.setString(2,id);	
		         System.out.println("insertRental - 1-2");
		         rs = pstmt.executeQuery();
		         System.out.println(pstmt);
		         System.out.println("insertRental - 1");
		         if(rs.next()) {
		        	isbn.add(rs.getString(1));
	//	        	 isbn = (List<String>) rs.getArray(1);
	//	        	 isbn = (List<String>) rs.getArray(1);
		         }
	         System.out.println("insertRental - 2");
	    	}
	    	System.out.println("insertRental - 3");
	    	String sql2 = "select max(num) from rental";
	        pstmt2 = con.prepareStatement(sql2);
	        rs2 = pstmt2.executeQuery();
	        if(rs2.next()) {
	            num = rs.getInt(1) + 1; // 새 글 번호 만들기
	         } 
	        
	    	for(int i=0; i< isbn.size(); i++) {
	    		System.out.println("insertRental - isbn 여기엔 무엇이..?" + isbn);
	    		String sql = "insert into rental (num,isbn,id) values(?,?,?)";
	            pstmt2 = con.prepareStatement(sql);
	            pstmt2.setInt(1, num); 
	            pstmt2.setString(2, isbn.get(i));
	            pstmt2.setString(3, id);
	    		
	            System.out.println(pstmt);
	            insertCount = pstmt2.executeUpdate();
	            System.out.println("insertcount에는 뭐들어가는거야" + insertCount);
	    	}
	    	int isUpdate = 0;
	    	for(int i=0; i< isbn.size(); i++) {
	    		System.out.println("이것도 한번에 처리 될까?");
	    		String sql = "update book set count=count+1 where isbn =?";
			       pstmt3=con.prepareStatement(sql);
			       pstmt3.setString(1, isbn.get(i));
			       isUpdate = pstmt3.executeUpdate();
	    	}
	    	
	      } catch (SQLException e) {
	         System.out.println("insertBookDibs() 오류! - " + e.getMessage());
	         e.printStackTrace();
	      } finally {
	    	  close(rs);
	    	  close(rs2);
	         close(pstmt);
	         close(pstmt2);
	         close(pstmt3);
	      }
	      return insertCount;      
	}
}