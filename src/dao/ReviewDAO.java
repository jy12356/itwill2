package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BookBean;
import vo.CommentBean;
import vo.LikeBean;
import vo.ReviewBean;

import static db.JdbcUtil.*;

public class ReviewDAO {
	
	public ReviewDAO() {}
	
	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		System.out.println("ReviewDAO - 1. getInstance()");
				
		return instance;
	}
		
	Connection con;
	
	// 외부(Service 클래스)로부터 Connection 객체를 전달받아 멤버변수에 저장하는 setConnection() 메서드 정의
	public void setConnection(Connection con) {
		System.out.println("ReviewDAO - 2. setConnection()");
		
		this.con = con;
	}
	
	// 서평 등록 --------------------------------------------------------
	public int insertArticle(ReviewBean reviewBean) {
		System.out.println("ReviewDAO - 3. insertArticle()");
		
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = 1;
		
		try {
			String sql = "SELECT MAX(num) FROM review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			sql = "INSERT INTO review values(?,?,?,now(),?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, reviewBean.getId());
			pstmt.setString(3, reviewBean.getContent());
			pstmt.setInt(4, reviewBean.getStarcount());
			pstmt.setInt(5, reviewBean.getLikecount());
			pstmt.setString(6, reviewBean.getIsbn());
			pstmt.setInt(7, reviewBean.getSpoiler());
			
			insertCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertArticle() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return insertCount;
	}

	// 서평 등록 수 -------------------------------------------------------
	public int selectListCount(String isbn) {
		System.out.println("ReviewDAO - 4. selectListCount()");
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(isbn) FROM review WHERE isbn=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, isbn);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectListCount() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}	
	
	// 서평 리스트 ---------------------------------------------------------
	public ArrayList<ReviewBean> selectArticleList(int page, int limit, String isbn) {
		System.out.println("ReviewDAO - 5. selectArticleList()");
		
		ArrayList<ReviewBean> articleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 조회를 시작할 레코드(행) 번호 계산
		int startRow = (page - 1) * limit;
		
		try {
			// 게시물 조회
			// 리뷰번호(num)을 기준으로 내림차순 정렬
			// 조회 시작 게시물 번호(StarRow)를 기준으로 limit 갯수만큼 조회
			String sql = "SELECT * FROM review WHERE isbn=? ORDER BY num DESC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, isbn);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			
			// ArrayList 객체 생성
			articleList = new ArrayList<ReviewBean>();
			
			// 읽어올 게시물이 존재할 경우 다음 작업 반복
			// => ReviewBean 객체를 생성하여 레코드 데이터 모두 저장 후
			//    ReviewBean 객체를 다시 ArrayList 객체에 추가
			while(rs.next()) {
				ReviewBean article = new ReviewBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setContent(rs.getString("content"));
				article.setDate(rs.getDate("date"));
				article.setStarcount(rs.getInt("starcount"));
				article.setLikecount(rs.getInt("likecount"));
				article.setIsbn(rs.getString("isbn"));
				article.setSpoiler(rs.getInt("spoiler"));
				
				// 레코드 저장 확인용 코드
				System.out.println("제목 : " + article.getContent());

				// 1개 게시물을 전체 게시물 저장 객체(ArrayList)에 추가
				articleList.add(article);
			}		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectArticleList() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return articleList;
	}
	
	// 서평 수정 -------------------------------------------------
		public int updateArticle(ReviewBean article) {
			System.out.println("ReviewDAO - 7. updateArticle()");
			
			int updateCount = 0;
			PreparedStatement pstmt = null;
			
			try {
				String sql="UPDATE review SET content=?, spoiler=? WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, article.getContent());
				pstmt.setInt(2, article.getSpoiler());
				pstmt.setInt(3, article.getNum());
				updateCount = pstmt.executeUpdate();
				
			}catch(Exception e) {
				System.out.println("updateArticle() 오류! - " + e.getMessage());
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}
	
	// 서평 삭제 -------------------------------------------------
	public int deleteArticle(int num) {
		System.out.println("ReviewDAO - 7. deleteArticle()");
		
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM review WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			System.out.println("4.글번호 :" + num);

			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteArticle() 오류! - " + e.getMessage());
		} finally {

			close(pstmt);
		}
		return deleteCount;
	}
	
	// 글 작성자 복인 확인 -------------------------------------------------
	public boolean isArticleReviewWriter(int num, String id) {
		System.out.println("ReviewDAO - 6. isArticleReviewWriter()");
		
		boolean isArticleWriter = false;
		
		// board_num에 해당하는 레코드의 board_pass를 가져와서
		// 파라미터로 전달받은 board_pass와 비교하여 일치 여부
		// => 만약, 패스워드 일치하는 경우 isArticleWriter를 true로 변경
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id FROM review WHERE num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			System.out.println("2.글번호 :" + num);
			System.out.println("2.작성자 :" + id);
			if(rs.next()) {
				if(id.equals(rs.getString("id"))|| id.equals("admin")) {
					isArticleWriter = true;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isArticleReviewWriter() 오류! - " + e.getMessage());
		} finally {
			close(pstmt);
			close(rs);
		}
		return isArticleWriter;
	}

	// 댓글 등록-------------------------------------------------
		public int insertComment(CommentBean commentBean) {
			System.out.println("ReviewDAO - 9. insertComment()");
			
			int insertCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int num = 1;
			
			try {
				String sql = "SELECT MAX(comment_num) FROM comment";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					num = rs.getInt(1) + 1;
				}
				sql = "INSERT INTO comment values(?,?,?,?,?,?,?,?,now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, commentBean.getBoard_type());
				pstmt.setInt(3, commentBean.getBoard_num());
				pstmt.setString(4, commentBean.getComment_id());
				pstmt.setString(5, commentBean.getComment_desc());
				pstmt.setInt(6, num);
				pstmt.setInt(7, commentBean.getRe_lev());
				pstmt.setInt(8, commentBean.getRe_seq());
				
				insertCount = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("insertArticle() 오류! - " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}
			return insertCount;
		}	
		
		// 댓글 등록수 -------------------------------------------------
		public int selectListCount(int board_num, int board_type) {
			System.out.println("ReviewDAO - 댓글 : selectListCount()");
			int listCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT COUNT(board_num) FROM comment WHERE board_num=? and board_type=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				pstmt.setInt(2, board_type);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("selectListCount() 오류! - " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}
			return listCount;
		}
		
		// 댓글 리스트
		public ArrayList<CommentBean> selectArticleList(int page, int limit, int board_num, int board_type) {
			System.out.println("ReviewDAO - 5. selectArticleList()");
			
			ArrayList<CommentBean> articleList = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int startRow = (page - 1) * limit;
			
			try {
				// 게시물 조회
				// 리뷰번호(num)을 기준으로 내림차순 정렬
				// 조회 시작 게시물 번호(StarRow)를 기준으로 limit 갯수만큼 조회
				String sql = "SELECT * FROM comment WHERE board_type=? and board_num=? ORDER BY comment_num DESC LIMIT ?,?";
				
				pstmt = con.prepareStatement(sql);
				CommentBean commentBean = new CommentBean();
				pstmt.setInt(1, board_type);
				pstmt.setInt(2, board_num);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, limit);
				rs = pstmt.executeQuery();

				articleList = new ArrayList<CommentBean>();
				while(rs.next()) {
					CommentBean article = new CommentBean();
					article.setComment_num(rs.getInt("comment_num"));
					article.setBoard_type(rs.getInt("board_type"));
					article.setBoard_num(rs.getInt("board_num"));
					article.setComment_id(rs.getString("comment_id"));
					article.setComment_desc(rs.getNString("comment_desc"));
					article.setRe_ref(rs.getInt("re_ref"));
					article.setRe_lev(rs.getInt("re_lev"));
					article.setRe_seq(rs.getInt("re_seq"));
					commentBean.setDate(rs.getDate("date"));

					// 1개 게시물을 전체 게시물 저장 객체(ArrayList)에 추가
					articleList.add(article);
				}		
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("selectArticleList() 오류! - " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}
			return articleList;
		}

		// 댓글 수정 ----------------------------------------------------
		public int updateComment(CommentBean commentBean) {
			System.out.println("ReviewDAO - 댓글 : updateComment()");
			
			int updateCount = 0;
			
			PreparedStatement pstmt = null;
			
			try {
				String sql = "UPDATE comment SET comment_desc=? WHERE comment_num=?" ;
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, commentBean.getComment_desc());
				pstmt.setInt(2, commentBean.getComment_num());
				updateCount = pstmt.executeUpdate();

			}catch(Exception e) {
				System.out.println("updateArticle() 오류! - " + e.getMessage());
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}
		
		// 댓글 삭제 -------------------------------------------------
		public int deleteComment(int comment_num) {
			System.out.println("ReviewDAO - 댓글 : deleteComment()");
			int deleteCount = 0;
			
			PreparedStatement pstmt = null;
			
			try {
				String sql = "DELETE FROM comment WHERE comment_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, comment_num);
				System.out.println("4.댓글번호 :" + comment_num);
				
				deleteCount = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("deleteArticle() 오류! - " + e.getMessage());
			} finally {
				close(pstmt);
			}
			System.out.println("다시 돌아가는 중");
			return deleteCount;
		}
		
		// 댓글 작성자 본인 확인 ---------------------------------------------
		public boolean isArticleCommentWriter(int comment_num, int board_num, int board_type, String comment_id) {
			System.out.println("ReviewDAO - 댓글 : isArticleCommentWriter()");
			boolean isCommentWriter = false;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT comment_id FROM comment WHERE comment_num=? and board_num=? and board_type=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, comment_num);
				pstmt.setInt(2, board_num);
				pstmt.setInt(3, board_type);
				rs = pstmt.executeQuery();
				System.out.println("댓글번호 :" + comment_num);
				System.out.println("댓글타입 :" + board_type);
				System.out.println("리뷰번호 :" + board_num);
				System.out.println("댓글작성자 :" + comment_id);
				
				if(rs.next()) {
					if(comment_id.equals(rs.getString("comment_id")) || comment_id.equals("admin")) {
						isCommentWriter = true;
						System.out.println("true");
					} else {
						System.out.println("false");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("isArticleReviewWriter() 오류! - " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}
			return isCommentWriter;
		}
		
		// 좋아요 등록 ---------------------------------------------------
		public int insertLikeCount(LikeBean likeBean) {
			System.out.println("ReviewDAO - 11. insertLikeCount()");
			
			int insertLike = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int like_num = 1;
			
			try {
				String sql = "SELECT MAX(like_num) FROM likecount";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					like_num = rs.getInt(1) + 1;
					}
				sql = "INSERT INTO likecount values(?,?,'y',?,?)";
	
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, like_num);
				pstmt.setString(2, likeBean.getLike_id());
				pstmt.setInt(3, likeBean.getReview_num());
				pstmt.setString(4, likeBean.getBook_isbn());
				insertLike = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("insertLikeCount() 오류! - " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}
			return insertLike;
		}
		
		// 좋아요 등록 글 확인 ---------------------------------------------------		
		public ReviewBean selectArticle(int num) {
			System.out.println("ReviewDAO - 11. insertLikeCount()");
			
			ReviewBean article = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * FROM review WHERE num=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				System.out.println(pstmt);
				
				// 게시물이 존재할 경우 BoardBean 객체를 생성하여 게시물 내용 저장
				if(rs.next()) {
					article = new ReviewBean();
					article.setNum(rs.getInt("num"));
					article.setId(rs.getString("id"));
					article.setContent(rs.getString("content"));
					article.setDate(rs.getDate("date"));
					article.setStarcount(rs.getInt("starcount"));
					article.setLikecount(rs.getInt("likecount"));
					article.setIsbn(rs.getString("isbn"));
					article.setSpoiler(rs.getInt("spoiler"));
					System.out.println(article.getLikecount());
				}
				
			} catch (SQLException e) {
				System.out.println("selectArticle() 오류! - " + e.getMessage());
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return article;
		}
		
		// 좋아요 LikeCount 올리기 ---------------------------------------------------		
		public int updateLikecount(int num) {
			System.out.println("ReviewDAO - updateLikecount()");
			
			int updateCount = 0;
			
			PreparedStatement pstmt = null;
			
			try {
				String sql = "UPDATE review SET likecount=likecount+1 WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				updateCount = pstmt.executeUpdate();
				// 임시 확인용
				System.out.println("좋아요 증가 결과 : " + updateCount);
				
			} catch (SQLException e) {
				System.out.println("updateReadcount() 오류! - " + e.getMessage());
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return updateCount;
		}

		// 좋아요 중복 체크 ---------------------------------------------------------
		public boolean isArticleLikeWriter(String like_id, int review_num) {
			System.out.println("ReviewDAO - 6. isArticleLikeWriter()");
			
			boolean isLikeWriter = false;
			
			// board_num에 해당하는 레코드의 board_pass를 가져와서
			// 파라미터로 전달받은 board_pass와 비교하여 일치 여부
			// => 만약, 패스워드 일치하는 경우 isArticleWriter를 true로 변경
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT like_id FROM likecount WHERE review_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, review_num);
				rs = pstmt.executeQuery();
				System.out.println("2.글번호 :" + review_num);
				System.out.println("2.작성자 :" + like_id);
				
				if(rs.next()) {
					if(like_id.equals(rs.getString("like_id"))) {
						isLikeWriter = true;
						System.out.println("true");
					} else {
						System.out.println("false");
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("isArticleReviewWriter() 오류! - " + e.getMessage());
			} finally {
				close(pstmt);
				close(rs);
			}
			System.out.println("서비스로 돌아감");
			return isLikeWriter;
		}		
	}
