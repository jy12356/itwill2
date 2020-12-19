package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import static db.JdbcUtil.*;

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
	    String isbn =null; // 새 글 번호를 저장할 변수

	    try {
	    	for(int i=0; i< rentalAddList.size(); i++) {
	    		int a = rentalAddList.get(i);
	    		String sql = "select isbn from mybasket where num= ? and id=?";
			    System.out.println("515151515151 : "+rentalAddList.get(i));	
			    System.out.println("ididididididi: "+id);
			    pstmt = con.prepareStatement(sql);	
			    pstmt.setInt(1, a);	
			    pstmt.setString(2,id);	
		        System.out.println(pstmt);
		        rs = pstmt.executeQuery();
		        System.out.println("insertRental - 1");
		        if(rs.next()) {
		        	isbn=rs.getString(1);
		        }
		        System.out.println("insertRental - 2");
		    	
		    	sql = "select max(num) from rental";
		        pstmt = con.prepareStatement(sql);
		        rs = pstmt.executeQuery();
		        if(rs.next()) {
		            num = rs.getInt(1) + 1; // 새 글 번호 만들기
		         } 
		        
	    		System.out.println("insertRental - isbn 여기엔 무엇이..?" + isbn);
	    		sql = "insert into rental (num,isbn,id) values(?,?,?)";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, num); 
	            pstmt.setString(2, isbn);
	            pstmt.setString(3, id);
	    		
	            System.out.println(pstmt);
	            insertCount = pstmt.executeUpdate();
	            System.out.println("insertcount에는 뭐들어가는거야" + insertCount);
		
		    	int isUpdate = 0;
	    	    System.out.println("이것도 한번에 처리 될까?");
	    	    sql = "update book set count=count+1 where isbn =?";
	    	    pstmt=con.prepareStatement(sql);
	    	    pstmt.setString(1, isbn);
		        isUpdate = pstmt.executeUpdate();
	    	}
	    	
	      } catch (Exception e) {
	         System.out.println("insertBookDibs() 오류! - " + e.getMessage());
	         e.printStackTrace();
	      } finally {
	    	  close(rs);
	    	  close(pstmt);
	      }
	      return insertCount;      
	}
}