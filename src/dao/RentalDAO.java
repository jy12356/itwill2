package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import vo.FreeBoardBean;
import vo.MyBasketBean;
import vo.RentalBean;

import static db.JdbcUtil.*;

public class RentalDAO {
	private RentalDAO() {
	}

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
		String isbn = null; 
	

		try {
			for (int i = 0; i < rentalAddList.size(); i++) {
				int a = rentalAddList.get(i);
				String sql = "select isbn from mybasket where num= ? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, a);
				pstmt.setString(2, id);
				System.out.println(pstmt);
				rs = pstmt.executeQuery();
				System.out.println("insertRental - 1");
				if (rs.next()) {
					isbn = rs.getString(1);
				}
				System.out.println("insertRental - 2");

				//  리스트 순서만들기
				sql = "select max(num) from rental";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					num = rs.getInt(1) + 1; // 새 글 번호 만들기
				}
				// 여기에서 s_date , onrental_date, e_date 집어넣어주기 해야함

				sql = "update book set state=? where isbn=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "1");
				pstmt.setString(2, isbn);
				pstmt.executeUpdate();
				
				System.out.println("insertRental - isbn 여기엔 무엇이..?" + isbn);
				
				
				Date d = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				System.out.println("String타입 현재 날짜 : " +sdf.format(d));
				
				String nowdate = sdf.format(d);
				System.out.println("String타입 현재 날짜 " + nowdate);

				Date date1 = new Date();
				SimpleDateFormat format15 = new SimpleDateFormat("yyyy-MM-15");
				System.out.println("String타입 이달의 15일 : " +format15.format(date1)); // 이달의 15일
				
				String from = format15.format(date1);

				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

				Date to = transFormat.parse(from);

				System.out.println("String 15일 =>Date 타입 to : " +to); // 15일 String to date 크기비교를위해서

				
		        if (d.after(to) || d.equals(to)) { // 현재날짜가 15일보다 더크거나 같으면 다음달 1일이 도착일자
		             // 다음달 1일
		        	Calendar cal4 = Calendar.getInstance ( );//오늘 날짜를 기준으루..
					cal4.add (cal4.MONTH, +1); // 다음달
		        	SimpleDateFormat nextmonth1day = new SimpleDateFormat("yyyy-MM-01");
					String nextmonth1 = nextmonth1day.format(cal4.getTime());
					System.out.println("String 타입 다음달 의 1일 : " + nextmonth1);
					
					Calendar cal3 = Calendar.getInstance ( );
					cal3.add (cal3.MONTH, +1); // 다음달
					SimpleDateFormat nextmonth14day = new SimpleDateFormat("yyyy-MM-14");
					String nextmonth14 = nextmonth14day.format(cal3.getTime());
					System.out.println("String 타입 다음달 의 14일 : " + nextmonth14);
					
					Calendar cal2 = Calendar.getInstance ( );
					cal2.add (cal2.MONTH, +1); // 다음달
					SimpleDateFormat nextmonth15day = new SimpleDateFormat("yyyy-MM-15");
					String nextmonth15 = nextmonth15day.format(cal2.getTime());
					System.out.println("String 타입 다음달 의 15일 : " + nextmonth15);
				
				
				
				sql = "insert into rental (num,isbn,id,s_date,onrental_date,e_date) values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, isbn);
				pstmt.setString(3, id);
				pstmt.setString(4, nextmonth1);
				pstmt.setString(5, nextmonth14);
				pstmt.setString(6, nextmonth15);
				
		        } else { // 현재날짜가 15일보다 작을경우
		        	
		        	 Calendar today = new GregorianCalendar();
		             int year = today.get(Calendar.YEAR);
		             int month = today.get(Calendar.MONTH);
		             month += 1;
		             int maxday = today.getActualMaximum ( ( today.DAY_OF_MONTH ) );
		             System.out.println ( maxday );

		             String lastday = year+"-"+month+"-"+maxday;
		             System.out.println("마지막날은 : " + lastday);
		        	
		             Calendar cal4 = Calendar.getInstance ( );//오늘 날짜를 기준으루..
						cal4.add (cal4.MONTH, +1); // 다음달
			        	SimpleDateFormat nextmonth1day = new SimpleDateFormat("yyyy-MM-01");
						String nextmonth1 = nextmonth1day.format(cal4.getTime());
						System.out.println("String 타입 다음달 의 1일 : " + nextmonth1);
						
		        	sql = "insert into rental (num,isbn,id,s_date,onrental_date,e_date) values(?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setString(2, isbn);
					pstmt.setString(3, id);
					pstmt.setString(4, from);
					pstmt.setString(5, lastday);
					pstmt.setString(6, nextmonth1);
		        	
		        	
		        }

				System.out.println(pstmt);
				insertCount = pstmt.executeUpdate();
				System.out.println("insertcount에는 뭐들어가는거야" + insertCount);

				int isUpdate = 0;
				System.out.println("이것도 한번에 처리 될까?");
				sql = "update book set count=count+1 where isbn =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, isbn);
				isUpdate = pstmt.executeUpdate();

				System.out.println("insert 작업 완료했으면 mybasket에선 지워주기");
				sql = "delete from mybasket where isbn=? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, isbn);
				pstmt.setString(2, id);
				pstmt.executeUpdate();

			}

		} catch (Exception e) {
			System.out.println("insertRental() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}

	public int selectListCount(String id) {
		System.out.println("RentalDAO - selectListCount()");

		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM rental where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
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

	public ArrayList<RentalBean> selectRentalList(int page, int limit, String id) {

		System.out.println("RentalDAO - selectRentalList()");

		ArrayList<RentalBean> rentalList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 조회를 시작할 레코드(행) 번호 계산
		int startRow = (page - 1) * limit;

		try {
			String sql = "select r.num num, b.title title, r.isbn isbn, "
					+ "r.id id, r.s_date s_date, r.onrental_date onrental_date, " + "r.e_date e_date "
					+ "from rental as r join book as b on r.isbn = b.isbn "
					+ "where r.id=? order by r.num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();

			rentalList = new ArrayList<RentalBean>();

			while (rs.next()) {
				RentalBean rental = new RentalBean();
				rental.setNum(rs.getInt("num"));
				rental.setTitle(rs.getString("title"));
				rental.setIsbn(rs.getString("isbn"));
				rental.setId(rs.getString("id"));
				rental.setS_date(rs.getDate("s_date"));
				rental.setOnrental_date(rs.getDate("onrental_date"));
				rental.setE_date(rs.getDate("e_date"));

				rentalList.add(rental);
			}

		} catch (SQLException e) {
			System.out.println("selectRentalList() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return rentalList;
	}

	public int overlap(List<Integer> rentalAddList, String id) {
		int count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String isbn = null; 
		
		try {
			for (int i = 0; i < rentalAddList.size(); i++) {
				String sql = "select isbn from mybasket where num= ? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rentalAddList.get(i)); // 체크햇던 각각의 num값을 가져옴
				pstmt.setString(2, id);
				System.out.println(pstmt);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					isbn = rs.getString(1); // 각 숫자마다 가지고잇는 isbn 가져옴
				}
				
		        sql = "select isbn from rental where id=?"; // 렌탈에잇는 isbn가져오기
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, id);
		        rs = pstmt.executeQuery();
				while (rs.next()) {
					if (rs.getString("isbn").equals(isbn)) {
						count = 1;
					}
				}
			}
			
		} catch (Exception e) {
			System.out.println("count 오류!" + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return count;
	}

	public int insertReservation(List<Integer> reservationAddList, String id) {

		System.out.println("RentalDAO - insertReservation()");
		
		int insertCount = 0;
		int num = 1;
		int seq = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String isbn = null;
		
		try {
			for (int i = 0; i < reservationAddList.size(); i++) {
				
				String sql = "select isbn from mybasket where num= ? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, reservationAddList.get(i));
				pstmt.setString(2, id);
				System.out.println(pstmt);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					isbn = rs.getString(1);
				}
				
				sql = "select max(num) from reservation";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					num = rs.getInt(1) + 1; // 새 글 번호 만들기
					
				}
				
				sql = "select max(seq) from reservation";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					seq = rs.getInt(1) + 1; // 새 글 번호 만들기
					
				}
				
				sql = "insert into reservation values(?,?,?,?,now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, isbn);
				pstmt.setString(3, id);
				pstmt.setInt(4, seq);
				
				insertCount = pstmt.executeUpdate();
				
				
				
				
			}
			
		} catch (Exception e) {
			System.out.println("insertReservation() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		
		
		
		return insertCount;
		
	}

	
	
	
	public int rentalDelete(List<Integer> inerNumList, String id) {
		 System.out.println("rentalDAO - rentalDelete");
	      int isDeleteOk = 0;
	      PreparedStatement pstmt = null;
	      try {
	    	  
//	    	  GregorianCalendar today = new GregorianCalendar();
//	          int Year = today.get(Calendar.YEAR);
//	          int Month = today.get(Calendar.MONTH);
//	          int Date = today.get(Calendar.DATE);
//	          int Hour = today.get(Calendar.HOUR_OF_DAY);
//	          today.add(Calendar.DAY_OF_MONTH, -3);
//	          System.out.println(today);
//	          SimpleDateFormat threedaysago = new SimpleDateFormat("yyyy-MM-dd");
//	          String daysago = threedaysago.format(today.getTime());
//	          System.out.println("3일전 : " + daysago);
//	    	  
//
//	          SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//	          Date to = transFormat.parse(daysago); //



	    	  
	    	  
	    	  
	    	  
	         for(int i=0; i< inerNumList.size(); i++) {
	            String sql = "delete from rental where num=? and id=?";
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
	
	
	// 반납용
//	public int updateArticle(RentalBean article) {
//		int updateCount = 0;
//		PreparedStatement pstmt = null;
//		
//		try {
//			String sql = "update rental set state=? where num=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, article.getState());
//			pstmt.setInt(2, article.getNum());
//			updateCount = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("updateArticle() 오류! - " + e.getMessage());
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		return updateCount;
//	}

	// 반납용
	public int selectListCountt() {
		System.out.println("RentalDAO - selectListCount()");
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM rental";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
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

	// 반납용
	public ArrayList<RentalBean> selectRentalListt(int page, int limit) {
		System.out.println("RentalDAO - selectRentalList()");

		ArrayList<RentalBean> rentalList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 조회를 시작할 레코드(행) 번호 계산
		int startRow = (page - 1) * limit;

		try {
			String sql = "select r.num num, b.title title, r.isbn isbn, "
					+ "r.id id, r.s_date s_date, r.onrental_date onrental_date, " + "r.e_date e_date "
					+ "from rental as r join book as b on r.isbn = b.isbn "
					+ "order by r.num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			rentalList = new ArrayList<RentalBean>();

			while (rs.next()) {
				RentalBean rental = new RentalBean();
				rental.setNum(rs.getInt("num"));
				rental.setTitle(rs.getString("title"));
				rental.setIsbn(rs.getString("isbn"));
				rental.setId(rs.getString("id"));
				rental.setS_date(rs.getDate("s_date"));
				rental.setOnrental_date(rs.getDate("onrental_date"));
				rental.setE_date(rs.getDate("e_date"));

				rentalList.add(rental);
			}

		} catch (SQLException e) {
			System.out.println("selectRentalList() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return rentalList;
	}
	
	// 반납용
	public int deleteArticle(int num) {
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		System.out.println("num = " + num);
		
		try {
			String sql = "delete from rental where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteCount;
	}


}























