package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BookBean;
import vo.FreeBoardBean;
import vo.NoticeBean;
import vo.QnaBean;

import static db.JdbcUtil.*;


public class SearchAllDAO {
	
	public SearchAllDAO() {}
	
	private static SearchAllDAO instance = new SearchAllDAO();

	public static SearchAllDAO getInstance() {				
		return instance;
	}
		
	Connection con;
	
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아 멤버변수에 저장하는 setConnection() 메서드 정의
	public void setConnection(Connection con) {		
		this.con = con;
	}
	public ArrayList<BookBean> selectBookAllList(String search) {
		System.out.println("SearchAllDAO - selectBookAllList()");
		ArrayList<BookBean> bookAllList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select b.*,r.count review, r.starcount starcount  from book b left outer join  (select isbn, count(*) count,round(10/sum(starcount),0) starcount from review  group by isbn) r on b.isbn = r.isbn where title like ? order by pubdate desc";
			pstmt=con.prepareStatement(sql);
			System.out.println(search);
			pstmt.setString(1, '%'+search+'%');

			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			bookAllList = new ArrayList<BookBean>();
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
				bookBean.setReviewCount(rs.getInt("review"));
				bookBean.setStarcount(rs.getInt("starcount"));
				bookAllList.add(bookBean);
		}
			
		}catch (Exception e) {
			System.out.println("selectBookAllList오류!" + e.getMessage());;
			e.printStackTrace();
		}finally {
			close(rs);	
			close(pstmt);
		}
		return bookAllList;
	}
	
	// 게시물 목록 조회
	public ArrayList<FreeBoardBean> selectFreeBAllList(String search) {
		System.out.println("SearchAllDAO - selectFreeBAllList()");
		// 지정된 갯수만큼의 게시물 조회 후 ArrayList 객체에 저장한 뒤 리턴
		ArrayList<FreeBoardBean> freeBAllList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 게시물 조회
			// 참조글번호(board_re_ref) 번호를 기준으로 내림차순 정렬,
			// 순서번호(board_re_seq) 번호를 기준으로 오름차순 정렬
			// 조회 시작 게시물 번호(startRow)부터 limit 갯수만큼 조회
			String sql = "SELECT * FROM freeboard where board_subject like ? ORDER BY board_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();

			// ArrayList 객체 생성(while문 위에서 생성 필수!)
			freeBAllList = new ArrayList<FreeBoardBean>();

			// 읽어올 게시물이 존재할 경우 다음 작업 반복
			// => BoardBean 객체를 생성하여 레코드 데이터 모두 저장 후
			// BoardBean 객체를 다시 ArrayList 객체에 추가
			// => 단, 패스워드(board_pass) 는 제외
			while (rs.next()) {
				// 1개 게시물 정보를 저장할 BoardBean 객체 생성 및 데이터 저장
				FreeBoardBean fb = new FreeBoardBean();
				fb.setBoard_num(rs.getInt("board_num"));
				fb.setBoard_subject(rs.getString("board_subject"));
				fb.setBoard_id(rs.getString("board_id"));
				fb.setBoard_content(rs.getString("board_content"));
				fb.setBoard_file(rs.getString("board_file"));
				fb.setBoard_readcount(rs.getInt("board_readcount"));
				fb.setBoard_date(rs.getDate("board_date"));

				// 레코드 저장 확인용 코드
//					System.out.println("제목 : " + article.getBoard_subject());

				// 1개 게시물을 전체 게시물 저장 객체(ArrayList)에 추가
				freeBAllList.add(fb);
			}

		} catch (SQLException e) {
			System.out.println("selectFreeBAllList() 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return freeBAllList;
	}
	
	// 게시물 목록 조회
	public ArrayList<QnaBean> selecQnaAllList(String search) {
		System.out.println("SearchAllDAO - selecQnaAllList()");

		ArrayList<QnaBean> qnaAllList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM qna where title like ? ORDER BY re_ref DESC,re_seq ASC ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			// ArrayList 객체 생성(while문 위에서 생성 필수!)
			qnaAllList = new ArrayList<QnaBean>();
			while(rs.next()) {
				QnaBean article = new QnaBean();
				article.setBoard_num(rs.getInt("board_num"));
				article.setId(rs.getString("id"));
				article.setPass(rs.getString("pass"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setQna_genre(rs.getString("qna_genre"));
				article.setRe_ref(rs.getInt("re_ref"));
				article.setRe_lev(rs.getInt("re_lev"));
				article.setRe_seq(rs.getInt("re_seq"));
				article.setDate(rs.getDate("date"));
				qnaAllList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("selectArticleList() 오류! - " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return qnaAllList;
	}

	public ArrayList<NoticeBean> selectNoticeAllList(String search){
		System.out.println("SearchAllDAO - selectNoticeAllList()");
		//지정된 갯수만큼의 게시물 조회 후 ArrayList 객체에 저장한 뒤 리턴
		ArrayList<NoticeBean> noticeAllList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//게시물 조회
			//참조글 번호(board_re_ref) 번호를 기준으로 내림차순 정렬,
			//순서번호(board_re_seq) 번호를 기준으로 오름차순 정렬
			//조회 시작 게시물 번호(startRow)를 기준으로 limit갯수만큼 조회
			String sql = "select * from notice where subject like ? ORDER BY num DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			//ArrayList 객체 생성
			noticeAllList = new ArrayList<NoticeBean>();
			//읽어올 게시물이 존재할 경우
			//BoardBean 객체를 생성하여 레코드 데이터 모두 저장 후
			//BoardBean 객체를 다시 ArrayList 객체에 추가
			//=>단, 패스워드(board_pass)는 제외
			while(rs.next()) {
				NoticeBean article = new NoticeBean();
				article.setNum(rs.getInt("num"));
				article.setSubject(rs.getString("subject"));
				article.setId(rs.getString("id"));
				article.setContent(rs.getString("content"));
				article.setFile(rs.getString("file"));
				article.setKind(rs.getString("kind"));
				article.setDate(rs.getDate("date"));
				noticeAllList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("selectNoticeAllList() 오류 " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return noticeAllList;
	}

}