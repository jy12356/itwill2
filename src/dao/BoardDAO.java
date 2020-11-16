package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardDAO {
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
	private static BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {}

	public static BoardDAO getInstance() {
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
	public int insertArticle(BoardBean boardBean) {
		System.out.println("BoardDAO - insertArticle()");
		int insertCount = 1; //0이면 실패 1이면 성공
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 0; //글 번호 저장 변수
		
		String sql = "select max(board_num) from board";
		try {
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
		if(rs.next()) {
			num = rs.getInt(1) + 1;
		}
		sql = "INSERT INTO board Values(?,?,?,?,?,?,?,?,?,now())";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, boardBean.getBoard_name());
		pstmt.setString(3, boardBean.getBoard_pass());
		pstmt.setString(4, boardBean.getBoard_subject());
		pstmt.setString(5, boardBean.getBoard_content());
		pstmt.setString(6, boardBean.getBoard_file());
		pstmt.setInt(7, num); //참조글 번호(새 글이므로 자신이 참조글이 됨)
		pstmt.setInt(8, boardBean.getBoard_re_lev());
		pstmt.setInt(9, boardBean.getBoard_re_seq());
		pstmt.setInt(10, boardBean.getBoard_readcount());
		//INSERT 구문 실행 결과값을 int형 변수 insertCount에 저장
		insertCount = pstmt.executeUpdate();
	} catch (SQLException e) {
		System.out.println("insertArticle() 오류! - " + e.getMessage());
		e.printStackTrace();
	}finally {
		//자원 반환
		//DAO 클래스 내에서  Connection 객체 반환 금지
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
			String sql = "select count(board_num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}catch(SQLException e){
				System.out.println("selectListCount() 오류" + e.getMessage());
				e.printStackTrace();
			}finally {
			
		}
		return listCount;
	}

	public ArrayList<BoardBean> selectarticleList(int page, int limit) {
		//지정된 갯수만큼의 게시물 조회 후 ArrayList 객체에 저장한 뒤 리턴
		ArrayList<BoardBean> articleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//조회를 시작할 레코드(행)번호 계산
		int startRow = (page -1) *10;
		try {
			//게시물 조회
			//참조글 번호(board_re_ref) 번호를 기준으로 내림차순 정렬,
			//순서번호(board_re_seq) 번호를 기준으로 오름차순 정렬
			//조회 시작 게시물 번호(startRow)를 기준으로 limit갯수만큼 조회
			String sql = "select * from board "+"ORDER BY board_re_ref desc, board_re_seq ASC " + "LIMIT ?,? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			//ArrayList 객체 생성
			articleList = new ArrayList<BoardBean>();
			//읽어올 게시물이 존재할 경우
			//BoardBean 객체를 생성하여 레코드 데이터 모두 저장 후
			//BoardBean 객체를 다시 ArrayList 객체에 추가
			//=>단, 패스워드(board_pass)는 제외
			while(rs.next()) {
				BoardBean article = new BoardBean();
				article.setBoard_num(rs.getInt("board_num"));
				article.setBoard_name(rs.getString("board_name"));
				article.setBoard_subject(rs.getString("board_subject"));
				article.setBoard_content(rs.getString("board_content"));
				article.setBoard_file(rs.getString("board_file"));
				article.setBoard_re_ref(rs.getInt("board_re_ref"));
				article.setBoard_re_lev(rs.getInt("board_re_lev"));
				article.setBoard_re_seq(rs.getInt("board_re_seq"));
				article.setBoard_readcount(rs.getInt("board_readcount"));
				article.setBoard_date(rs.getDate("board_date"));
				
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("selectArticleList() 오류 " + e.getMessage());
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	// -------------------------------------------------------------------
	
	
	
	
}











