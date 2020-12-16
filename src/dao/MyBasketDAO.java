package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BookBean;

public class MyBasketDAO {

	private MyBasketDAO() {}
	
	private static MyBasketDAO instance = new MyBasketDAO();
	
	public static MyBasketDAO getInstance() {
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	
	public int selectListCount(String id) {
		System.out.println("MyBasketDAO - selectListCount()");

		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM mybasket where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("selectListCount() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	


	public ArrayList<BookBean> selectBasketList(int page, int limit, String id) {
		System.out.println("MyBasketDAO - selectBasketList()");

		ArrayList<BookBean> basketList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 조회를 시작할 레코드(행) 번호 계산
		int startRow = (page - 1) * limit;
		try {
			// 게시물 조회
			String sql = "select b.num num, b.title title, b.author author, "
					+ "b.publisher publisher, b.pubdate pubdate,"
					+ "k.isbn isbn, min(case when b.state = 0 then '대여가능' else '대여불가능' end) as state "
					+ "from mybasket as k join book as b on k.isbn = b.isbn "
					+ "where k.id=? group by b.isbn limit ?,?;";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			System.out.println("pstmt : " +  pstmt);
			rs = pstmt.executeQuery();
			
			// ArrayList 객체 생성(while문 위에서 생성 필수!)
			basketList = new ArrayList<BookBean>();
			while(rs.next()) {
				BookBean basket = new BookBean();
				basket.setNum(rs.getInt("num"));
				basket.setTitle(rs.getString("title"));
				basket.setAuthor(rs.getString("author"));
				basket.setPublisher(rs.getString("publisher"));
//				basket.setPubdate(rs.getDate("pubdate"));
				basket.setPubdate(rs.getString("pubdate"));
				basket.setState(rs.getString("state"));
				basket.setIsbn(rs.getString("isbn")); // 필요한가이거?
				System.out.println(basket.getState());
				basketList.add(basket);
			}
			
		} catch (SQLException e) {
			System.out.println("selectBasketList() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return basketList;
	}
	
	
	
	
	public int insertBasket(String isbn, String id) {
		System.out.println("MyBasketDAO - insertBasket()");
		int insertCount = 0; // INSERT 작업 수행 결과를 저장할 변수
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 1;
		
		try {
			String sql = "select max(num) from mybasket";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1; // 새 글 번호 만들기
			} 
			sql = "insert into mybasket (num,isbn,id) VALUES (?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); 
			pstmt.setString(2, isbn);
			pstmt.setString(3, id);
			System.out.println(pstmt);
			// INSERT 구문 실행 결과값을 int형 변수 insertCount 에 저장
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertBasket() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;		
		
		
	}


	public String stateMem(String id) {
		System.out.println("MyBasketDAO - stateMem()");
		String state = "";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select state from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				state = rs.getString(1);
			}
			System.out.println(state);
		} catch (Exception e) {
			System.out.println("stateMem() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return state;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
