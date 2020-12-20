package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
//				System.out.println("515151515151 : " + rentalAddList.get(i));
//				System.out.println("ididididididi: " + id);
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

		return 0;
	}

	public int rentalDelete(List<Integer> inerNumList, String id) {
		 System.out.println("rentalDAO - rentalDelete");
	      int isDeleteOk = 0;
	      PreparedStatement pstmt = null;
	      try {
	         for(int i=0; i< inerNumList.size(); i++) {
	            String sql = "delete from rental where num=? and id=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, inerNumList.get(i));
	            pstmt.setString(2,id);
	            System.out.println(pstmt);
	            isDeleteOk = pstmt.executeUpdate();
	         }
	      }catch (Exception e) {
	         System.out.println("dibsDelete 오류!" + e.getMessage());
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return isDeleteOk;
	}

}























