package dao.NoticeDAO;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.NoticeVo.NoticeBean;

public class NoticeDAO {
	/*
	 * ========================================================================
	 * 싱글톤 디자인 패턴을 활용한 BoardDAO 인스턴스 작업
	 * 1. 외부에서 인스턴스 생성이 불가능하도록 생성자 호출을 막기 위해
	 *    private 접근제한자를 적용하여 생성자 정의
	 * 2. 직접 DAO 클래스의 인스턴스를 생성하여 멤버변수(instance)로 저장 
	 *    => 접근제한자 private 로 설정하여 외부에서 접근 불가능하도록 지정
	 *    => 생성자를 리턴하는 static 메서드 getInstance() 에서
	 *       멤버변수에 접근할 수 있도록 static 멤버변수로 선언
	 * 3. 생성된 인스턴스를 외부로 리턴하기 위해 Getter 메서드(getInstance) 정의
	 *    => 파라미터 : 없음, 리턴타입 : BoardDAO
	 *    => 외부에서 인스턴스 생성 없이도 호출 가능하도록 static 메서드로 정의    
	 */
	private NoticeDAO() {}
	
	private static NoticeDAO instance = new NoticeDAO();

	public static NoticeDAO getInstance() {
		return instance;
	}
	// ========================================================================

	Connection con; // Connection 객체를 전달받아 저장할 멤버변수

	// 외부(Service 클래스)로부터 Connection 객체를 전달받아
	// 멤버변수에 저장하는 setConnection() 메서드 정의
	public void setConnection(Connection con) {
		this.con = con;
	}

	// 글 등록 작업
	public int insertArticle(NoticeBean noticeBean) {
		// Service 클래스로부터 BoardBean 객체를 전달받아
		// DB의 board 테이블에 INSERT 작업 수행하고 결과(int타입)를 리턴
		System.out.println("NoticeDAO - insertArticle()");
		int insertCount = 0; // INSERT 작업 수행 결과를 저장할 변수
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1; // 새 글 번호를 저장할 변수
		
		try {
			System.out.println(noticeBean.getId());
			System.out.println(noticeBean.getNum());
			System.out.println(noticeBean.getSubject());
			System.out.println(noticeBean.getContent());
			System.out.println(noticeBean.getKind());
			// 현재 게시물 번호(board_num) 중 가장 큰 번호를 조회하여
			// 해당 번호 + 1 값을 새 글 번호(num)으로 저장
			String sql = "SELECT MAX(num) FROM notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// 조회된 결과가 있을 경우 조회된 번호 + 1 값을 num 에 저장
			// => 조회 결과가 없을 경우 새 글 번호는 1번이므로 기본값 그대로 사용
			if(rs.next()) {
				num = rs.getInt(1) + 1; // 새 글 번호 만들기
			} 
			// 전달받은 BoardBean 객체 내의 데이터를 사용하여 INSERT 작업 수행
			// => 컬럼 중 board_date 항목(작성일)은 now() 함수 사용
			sql = "INSERT INTO notice VALUES (?,?,?,	?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			
			
			// BoardBean 객체로부터 데이터를 꺼내서 쿼리문 ? 대체
			pstmt.setInt(1, num); // 글번호
			pstmt.setString(2, noticeBean.getSubject());
			pstmt.setString(3, noticeBean.getId());
			pstmt.setString(4, noticeBean.getContent());
			pstmt.setString(5, noticeBean.getFile());
			pstmt.setString(6, "종류 시발없어");
			// INSERT 구문 실행 결과값을 int형 변수 insertCount 에 저장
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insertArticle() - noticeDAO 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 자원 반환
			// 주의! DAO 클래스 내에서 Connection 객체 반환 금지!
			close(rs);
			close(pstmt);
		}
		return insertCount;
}

	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(num) from notice";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}catch(SQLException e){
				System.out.println("selectListCount() - Notice오류" + e.getMessage());
				e.printStackTrace();
			}finally {
			
		}
		return listCount;
	}

	public ArrayList<NoticeBean> selectArticleList(int page, int limit) {
		//지정된 갯수만큼의 게시물 조회 후 ArrayList 객체에 저장한 뒤 리턴
		ArrayList<NoticeBean> articleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//조회를 시작할 레코드(행)번호 계산
		int startRow = (page -1) *10;
		try {
			//게시물 조회
			//참조글 번호(board_re_ref) 번호를 기준으로 내림차순 정렬,
			//순서번호(board_re_seq) 번호를 기준으로 오름차순 정렬
			//조회 시작 게시물 번호(startRow)를 기준으로 limit갯수만큼 조회
			String sql = "select * from notice "+"ORDER BY num DESC " + "LIMIT ?,? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			//ArrayList 객체 생성
			articleList = new ArrayList<NoticeBean>();
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
				
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("selectArticleList() - NoticeBean오류 " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}

	// 게시물 상세 내용 조회
	public NoticeBean selectArticle(int num) {
		System.out.println("NoticeDAO - selectArticleList");
		// 글번호(board_num)에 해당하는 레코드를 SELECT
		// 조회 결과가 있을 경우 BoardBean 객체에 저장한 뒤 리턴
		NoticeBean article = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM notice WHERE num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			// 게시물이 존재할 경우 BoardBean 객체를 생성하여 게시물 내용 저장
			if(rs.next()) {
				article = new NoticeBean();
				article.setNum(rs.getInt("num"));
				article.setSubject(rs.getString("subject"));
				article.setId(rs.getString("id"));
				article.setContent(rs.getString("content"));
				article.setFile(rs.getString("file"));
				article.setKind(rs.getString("kind"));
				article.setDate(rs.getDate("date"));
				
//				 임시 확인용 상세 내용 출력
				System.out.println("글 제목 : " + article.getSubject());
			}
				
			
		} catch (SQLException e) {
			System.out.println("selectArticle() - Notice 오류! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return article;
	}

	// 조회수 증가
	public int updateReadcount(int num) {
		// 글번호(board_num)에 해당하는 게시물의 조회수(readcount)를 1 증가
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE notice SET readcount=board_readcount+1 "
					+ "WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			updateCount = pstmt.executeUpdate();
			
			// 임시 확인용
//			System.out.println("조회수 증가 결과 : " + updateCount);
		} catch (SQLException e) {
//			System.out.println("updateReadcount() 오류! - " + e.getMessage());
//			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	//공지 작성자 확인
	public boolean isArticleBoardWriter(int num, String id) {
		boolean isArticleWriter = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id from notice where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(id.equals(rs.getString("id"))) {
					isArticleWriter = true;
				}
			}
		}catch(SQLException e) {
			System.out.println("isArticleBoardWriter() - Notice 오류" + e.getMessage());
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return isArticleWriter;
	}
	
	//공지 수정
	public int updateArticle(NoticeBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE notice SET id=? subject=? , content=?, file=? WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getContent());
			pstmt.setString(4, article.getFile());
			pstmt.setInt(5, article.getNum());
			updateCount = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("updateArticle() - Notice 오류" + e.getMessage());
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateCount;
	}
}
