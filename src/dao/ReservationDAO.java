package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.RentalBean;
import vo.ReservationBean;

public class ReservationDAO {
	private ReservationDAO() {
	}

	private static ReservationDAO instance = new ReservationDAO();

	public static ReservationDAO getInstance() {
		return instance;
	}

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	
	
	public int selectListCount(String id) {
		
		System.out.println("ReservationDAO - selectListCount()");

		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT COUNT(*) FROM reservation where id=?";
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



	public int overlap(List<Integer> reservationAddList, String id) {
		int count = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String isbn = null; 
		
		try {
			for (int i = 0; i < reservationAddList.size(); i++) {
				String sql = "select isbn from mybasket where num= ? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, reservationAddList.get(i)); // 체크햇던 각각의 num값을 가져옴
				pstmt.setString(2, id);
				System.out.println(pstmt);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					isbn = rs.getString(1); // 각 숫자마다 가지고잇는 isbn 가져옴
				}
				
		        sql = "select isbn from reservation where id=?"; // reservation에잇는 isbn가져오기
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
		System.out.println("reservationDAO - insertReservation()");
		int insertCount = 0;
		int num = 1;
		int seq = 1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String isbn = null; 
		
		try {
			for (int i = 0; i < reservationAddList.size(); i++) {
				
				String sql = "select isbn from mybasket where num= ? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, reservationAddList.get(i));
				pstmt.setString(2, id);
				
				rs = pstmt.executeQuery();
				
				// isbn준비
				if (rs.next()) {
					isbn = rs.getString(1);
				}
				
				// 새 글 번호 만들기
				sql = "select max(num) from reservation";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					num = rs.getInt(1) + 1; 
				}
				// seq순서값 올리기
				sql = "select max(seq) from reservation where isbn = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, isbn);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					seq = rs.getInt(1) + 1; 
				}
				
				sql = "insert into reservation values(?,?,?,?,now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, isbn);
				pstmt.setString(3, id);
				pstmt.setInt(4, seq);
				
				insertCount = pstmt.executeUpdate();
				
				System.out.println("insert 작업 완료했으면 mybasket에선 지워주기");
				sql = "delete from mybasket where isbn=? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, isbn);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
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



	public ArrayList<ReservationBean> selectReservationList(int page, int limit, String id) {
		System.out.println("ReservationDAO - selectReservationList()");

		ArrayList<ReservationBean> reservationList = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 조회를 시작할 레코드(행) 번호 계산
		int startRow = (page - 1) * limit;

		try {
			String sql = "select r.num num, b.title title, r.isbn isbn, "
					+ "r.id id, r.seq seq, r.date date "
					+ "from reservation as r join book as b on r.isbn = b.isbn "
					+ "where r.id=? order by r.num desc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();

			reservationList = new ArrayList<ReservationBean>();

			while (rs.next()) {
				ReservationBean reservation = new ReservationBean();
				reservation.setNum(rs.getInt("num"));
				reservation.setTitle(rs.getString("title"));
				reservation.setIsbn(rs.getString("isbn"));
				reservation.setId(rs.getString("id"));
				reservation.setSeq(rs.getInt("seq"));
				reservation.setDate(rs.getDate("date"));
				
				reservationList.add(reservation);
			}

		} catch (SQLException e) {
			System.out.println("selectRentalList() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return reservationList;
	}



	public int reservationDelete(List<Integer> inerNumList, String id) {
		 System.out.println("reservationDAO - reservationDelete");
	      int isDeleteOk = 0;
	      PreparedStatement pstmt = null;
	      try {
	         for(int i=0; i< inerNumList.size(); i++) {
	        	 
//	        	String sql = "update 관리자쪽db set seq=seq-1 where seq > ? AND id-? ";
	        	 
	            String sql = "delete from reservation where num=? and id=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, inerNumList.get(i));
	            pstmt.setString(2,id);
	            System.out.println(pstmt);
	            isDeleteOk = pstmt.executeUpdate();
	         }
	      }catch (Exception e) {
	         System.out.println("reservationDelete 오류!" + e.getMessage());
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return isDeleteOk;
	}



	
	
	
	
	
	
}




















