package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BookBean;
import vo.BookInterestBean;

import static db.JdbcUtil.*;

public class BookDAO {
	private BookDAO() {}
	private static BookDAO instance = new BookDAO();
	
	public static BookDAO getInstance() {
		return instance;
	}
	
	Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	//책등록
	public int insertBook(BookBean bookBean) {
		// Service 클래스로부터 BoardBean 객체를 전달받아
		// DB의 board 테이블에 INSERT 작업 수행하고 결과(int타입)를 리턴
		System.out.println("BookDAO - insertBook()");

		int insertCount = 0; // INSERT 작업 수행 결과를 저장할 변수
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1; // 새 글 번호를 저장할 변수
		
		try {
			// 현재 게시물 번호(board_num) 중 가장 큰 번호를 조회하여
			// 해당 번호 + 1 값을 새 글 번호(num)으로 저장
			String sql = "select max(num) from book";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 조회된 결과가 있을 경우 조회된 번호 + 1 값을 num 에 저장
			// => 조회 결과가 없을 경우 새 글 번호는 1번이므로 기본값 그대로 사용
			if(rs.next()) {
				num = rs.getInt(1) + 1; // 새 글 번호 만들기
			} 
			// 전달받은 BoardBean 객체 내의 데이터를 사용하여 INSERT 작업 수행
			// => 컬럼 중 board_date 항목(작성일)은 now() 함수 사용
			sql = "insert into book "
					+ "(num,title,image,author,publisher,pubdate,isbn,description,catg1,catg2,state,count,author_info,index_info)"
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// BoardBean 객체로부터 데이터를 꺼내서 쿼리문 ? 대체
			pstmt.setInt(1, num); // 글번호
			pstmt.setString(2, bookBean.getTitle());
			pstmt.setString(3, bookBean.getImage());
			pstmt.setString(4, bookBean.getAuthor());
			pstmt.setString(5, bookBean.getPublisher());
			pstmt.setString(6, bookBean.getPubdate());
			pstmt.setString(7, bookBean.getIsbn());
			pstmt.setString(8, bookBean.getDescription());
			pstmt.setString(9, bookBean.getCatg1());
			pstmt.setString(10, bookBean.getCatg2());
			pstmt.setString(11, "0");
			pstmt.setInt(12, 0);
			pstmt.setString(13, bookBean.getAuthor_info());
			pstmt.setString(14, bookBean.getIndex());
			System.out.println(pstmt);
			// INSERT 구문 실행 결과값을 int형 변수 insertCount 에 저장
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertArticle() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;		
	}
	//책 리스트
	public ArrayList<BookBean> selectBookList(int page, int limit,String catg1,String catg2) {
		System.out.println("BookDAO - selectList()");
		ArrayList<BookBean> bookList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//조회를 시작할 레코드 행 번호 계산
		int startRow=(page-1)*limit;
		
		String sql = "select * from book where catg1 like ? and catg2 like ? order by pubdate desc limit ?,?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+catg1);
			pstmt.setString(2, "%"+catg2);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, limit);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			bookList = new ArrayList<BookBean>();
			while(rs.next()) {
				BookBean bookBean = new BookBean();
				bookBean.setNum(rs.getInt("num"));
				bookBean.setTitle(rs.getString("title"));
				bookBean.setCatg1(rs.getString("catg1"));
				bookBean.setCatg2(rs.getString("catg2"));
				bookBean.setAuthor(rs.getString("author"));
				bookBean.setPublisher(rs.getString("publisher"));
				bookBean.setPubdate(rs.getString("pubdate"));
				bookBean.setIsbn(rs.getString("isbn"));
				bookBean.setState(rs.getString("state"));
				bookBean.setCount(rs.getInt("count"));
				bookBean.setAuthor_info(rs.getString("author_info"));
				bookBean.setIndex(rs.getString("index_info"));
				bookBean.setImage(rs.getString("image"));
				bookBean.setDescription(rs.getString("description"));
				bookList.add(bookBean);
			}
			
		}catch (Exception e) {
			System.out.println("selectBookList오류!" + e.getMessage());;
			e.printStackTrace();
		}finally {
			close(rs);	
			close(pstmt);
		}
		return bookList;
	}
	//전체책 갯수
	public int selectListCount() {
		System.out.println("BookDAO - selectListCount()");
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from book";
		try {
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}catch (Exception e) {
			System.out.println("selectListCount 오류!:"+e.getMessage());
			e.printStackTrace();
		}
		
				
		
		return listCount;
	}
	//책상세정보
	public BookBean getBookInfo(String book_isbn) {
		PreparedStatement pstmt =  null;
		ResultSet rs = null;
		String sql="select * from book where isbn=?";
		BookBean bookBean = null;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, book_isbn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bookBean = new BookBean();
				bookBean.setTitle(rs.getString("title"));
				bookBean.setAuthor(rs.getString("author"));
				bookBean.setAuthor_info(rs.getString("author_info"));
				bookBean.setCatg1(rs.getString("catg1"));
				bookBean.setCatg2(rs.getString("catg2"));
				bookBean.setCount(rs.getInt("count"));
				bookBean.setDescription(rs.getString("description"));
				bookBean.setImage(rs.getString("image"));
				bookBean.setIndex(rs.getString("index_info"));
				bookBean.setIsbn(rs.getString("isbn"));
				bookBean.setNum(rs.getInt("num"));
				bookBean.setPubdate(rs.getString("pubdate"));
				bookBean.setPublisher(rs.getString("publisher"));
				bookBean.setState(rs.getString("state"));
				
			}
		}catch (Exception e) {
			System.out.println("getBookInfo : " + e.getMessage());
			e.printStackTrace();
		}
		return bookBean;
	}
	public int selectListKindCount(String isbn) {
		System.out.println("BookDAO - selectListKindCount()");
		int listCount = 0; // select 작업 수행 결과를 저장할 변수
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql="select count(num) from book where isbn=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount=rs.getInt(1);
			}
		
		} catch (SQLException e) {
			System.out.println("selectListKindCount()오류: " +e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return listCount;	
	}
	public ArrayList<BookBean> bookKindList(String isbn,int page,int limit) {
		System.out.println("bookDAO - bookKindList");
		ArrayList<BookBean> bookList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//조회를 시작할 레코드 행 번호 계산
		int startRow=(page-1)*limit;
		
		String sql = "select * from book where isbn=? order by pubdate desc limit ?,? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			bookList = new ArrayList<BookBean>();
			while(rs.next()) {
				BookBean bookBean = new BookBean();
				bookBean.setNum(rs.getInt("num"));
				bookBean.setTitle(rs.getString("title"));
				bookBean.setCatg1(rs.getString("catg1"));
				bookBean.setCatg2(rs.getString("catg2"));
				bookBean.setAuthor(rs.getString("author"));
				bookBean.setPublisher(rs.getString("publisher"));
				bookBean.setPubdate(rs.getString("pubdate"));
				bookBean.setIsbn(rs.getString("isbn"));
				bookBean.setState(rs.getString("state"));
				bookBean.setCount(rs.getInt("count"));
				bookBean.setAuthor_info(rs.getString("author_info"));
				bookBean.setIndex(rs.getString("index_info"));
				bookBean.setImage(rs.getString("image"));
				bookBean.setDescription(rs.getString("description"));
				bookList.add(bookBean);
			}
			
		}catch (Exception e) {
			System.out.println("selectBookList오류!" + e.getMessage());;
			e.printStackTrace();
		}finally {
			close(rs);	
			close(pstmt);
		}
		return bookList;
	}
	public int deleteBook(int book_num) {
		System.out.println("bookDAO - deleteBook");
		int isDeleteOk = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from book where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			isDeleteOk = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("deleteBook 오류!" + e.getMessage());
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return isDeleteOk;
	}
	public int bookExis(int book_num) {
		int isBookExisCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from book where num =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, book_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isBookExisCount = 1;
			}
		} catch (Exception e) {
			System.out.println("bookExis 오류!" + e.getMessage() );
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		
		return isBookExisCount;
	}
	public int modifyBook(BookBean bookBean, String title, String isbn) {
		System.out.println("bookDAO - modifyBook");
		int modyfiySeccess =0;
		PreparedStatement pstmt = null;
		try {
			String sql = "update book set "
					+ "title=?, isbn=?, author=?,author_info=?,catg1=?,catg2=?," 
					+ "description=?,index_info=?,pubdate=?,publisher=?,image=? "
					+ "where title=? and isbn=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookBean.getTitle());
			pstmt.setString(2, bookBean.getIsbn());
			pstmt.setString(3, bookBean.getAuthor());
			pstmt.setString(4, bookBean.getAuthor_info());
			pstmt.setString(5, bookBean.getCatg1());
			pstmt.setString(6, bookBean.getCatg2());
			pstmt.setString(7, bookBean.getDescription());
			pstmt.setString(8, bookBean.getIndex());
			pstmt.setString(9, bookBean.getPubdate());
			pstmt.setString(10, bookBean.getPublisher());
			pstmt.setString(11, bookBean.getImage());
			pstmt.setString(12, title);
			pstmt.setString(13, isbn);
			System.out.println(pstmt);
			modyfiySeccess = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("bookDAO - modifyBook 오류()!"+ e.getMessage()); 
			e.printStackTrace(); 
		}finally {
			close(pstmt);
			
		}
		return modyfiySeccess;
	}
	public int insertBookDibs(String isbn, String id) {
		System.out.println("BookDAO - insertBookDibs()");

		int insertCount = 0; // INSERT 작업 수행 결과를 저장할 변수
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1; // 새 글 번호를 저장할 변수
		
		try {
			String sql = "select max(num) from interestinglist";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1; // 새 글 번호 만들기
			} 
			sql = "insert into interestinglist (num,isbn,id) VALUES (?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num); 
			pstmt.setString(2, isbn);
			pstmt.setString(3, id);
			System.out.println(pstmt);
			// INSERT 구문 실행 결과값을 int형 변수 insertCount 에 저장
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insertBookDibs() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;		
	}
	public int selectListDibsCount(String id) {
		System.out.println("BookDAO - selectListDibsCount()");
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from interestinglist where id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
			
		}catch (Exception e) {
			System.out.println("selectListDibsCount 오류!:"+e.getMessage());
			e.printStackTrace();
		}
		return listCount;
	}
	public ArrayList<BookInterestBean> selectBookListDibsList(int page, int limit, String id) {
		System.out.println("BookDAO - selectBookListDibsList()");
		ArrayList<BookInterestBean> bookListDibsList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//조회를 시작할 레코드 행 번호 계산
		int startRow=(page-1)*limit;
		
		String sql = "select i.num num, "
						+ "i.isbn isbn,i.id id, b.title title, b.author author, "
						+ "b.publisher publisher, b.pubdate pubdate, "
						+ "case when b.state = 0 then '대여가능' else '대여불가능' end as state "
						+ "from interestinglist  as i join book as b on i.isbn = b.isbn "
						+ "where i.id=? order by i.num desc limit ?,?;";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			bookListDibsList = new ArrayList<BookInterestBean>();
			while(rs.next()) {
				BookInterestBean bookInterestBean = new BookInterestBean();
				bookInterestBean.setNum(rs.getInt("num"));
				bookInterestBean.setIsbn(rs.getString("isbn"));
				bookInterestBean.setId(rs.getString("id"));
				bookInterestBean.setTitle(rs.getString("title"));
				bookInterestBean.setAuthor(rs.getString("author"));
				bookInterestBean.setPublisher(rs.getString("publisher"));
				bookInterestBean.setPubdate(rs.getDate("pubdate"));
				bookInterestBean.setState(rs.getString("state"));
				bookListDibsList.add(bookInterestBean);
			}
			
		}catch (Exception e) {
			System.out.println("bookListDibsList오류!" + e.getMessage());;
			e.printStackTrace();
		}finally {
			close(rs);	
			close(pstmt);
		}
		return bookListDibsList;
	}
}
