package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.security.auth.login.LoginException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import vo.MemberBean;

//import db.JdbcUtil;
import static db.JdbcUtil.*;

public class MemberDAO {
	private MemberDAO() {
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	// ========================================================================

	Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}

	// MemberJoinPro.me
	public int insertMember(MemberBean memberBean) {
		System.out.println("MemberDAO - insertMember()");
		int insertCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = 1;

		try {
			String sql = "SELECT MAX(num) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			sql = "INSERT INTO member (num,id,password,email,phone,catg,age,address,name,date) VALUES (?,?,?,?,?,?,?,?,?,now())";
			pstmt.setInt(1, num);
			pstmt.setString(2, memberBean.getId());
			pstmt.setString(3, memberBean.getPassword());
			pstmt.setString(4, memberBean.getEmail());
			pstmt.setString(5, memberBean.getPhone());
			pstmt.setString(6, memberBean.getCatg());
			pstmt.setInt(7, memberBean.getAge());
			pstmt.setString(8, memberBean.getAddress());
			pstmt.setString(9, memberBean.getName());

			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("insertMember() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {

			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

	// MemberLoginePro.me
	public boolean isMember(String id, String password) throws LoginException {
		boolean isMember = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT password,id FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {

					isMember = true;
				} else {
					throw new LoginException();
				}
			} else {
				throw new LoginException();
			}

		} catch (SQLException e) {
			System.out.println("isMember() ERROR! - " + e.getMessage());

			e.printStackTrace();
		} finally {

			close(rs);
			close(pstmt);
		}

		return isMember;
	}

	// MemberList.me
	public int selectListCount() {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "SELECT count(num) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("selectListCount() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {

			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	// MemberList.me
	public ArrayList<MemberBean> selectArticleList(int page, int limit) {
		ArrayList<MemberBean> articleList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int startRow = (page - 1) * limit;

		try {
			String sql = "SELECT * FROM member ORDER BY num LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();

			articleList = new ArrayList<MemberBean>();

			while (rs.next()) {
				MemberBean article = new MemberBean();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setPassword(rs.getString("password"));
				article.setEmail(rs.getString("email"));
				article.setPhone(rs.getString("phone"));
				article.setCatg(rs.getString("catg"));
				article.setAge(rs.getInt("age"));
				article.setAddress(rs.getString("address"));
				article.setDate(rs.getTimestamp("date"));
				article.setName(rs.getString("name"));
				article.setState(rs.getString("state"));
				articleList.add(article);
			}

		} catch (SQLException e) {
			System.out.println("selectArticleList() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	// MemberModifyPro
	public int updateArticle(MemberBean article) {
		int updateCount = 0;

		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE member SET name=?, email=?, phone=?, catg=?, age=?, address=?, password=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getName());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getPhone());
			pstmt.setString(4, article.getCatg());
			pstmt.setInt(5, article.getAge());
			pstmt.setString(6, article.getAddress());
			pstmt.setString(7, article.getPassword());
			pstmt.setString(8, article.getId());
			updateCount = pstmt.executeUpdate();
			System.out.println("updateArticle() 성공! updateCount : " + updateCount);
		} catch (SQLException e) {
			System.out.println("updateArticle() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return updateCount;
	}

	// MemberDeletePro.me
	public int deleteArticle(MemberBean article) {
		int deleteCount = 0;

		PreparedStatement pstmt = null;
		try {
			String sql = "delete from member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getId());
			deleteCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("deleteArticle() ERROR! " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return deleteCount;
	}

	// MemberModifyForm.me // MemberDeleteForm.me
	public MemberBean selectMember(String id) {
		MemberBean article = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM member WHERE id=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			System.out.println(id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new MemberBean();
				article.setId(rs.getString("id"));
				article.setName(rs.getString("name"));
				article.setPassword(rs.getString("password"));
				article.setAddress(rs.getString("address"));
				article.setAge(rs.getInt("age"));
				article.setCatg(rs.getString("catg"));
				article.setEmail(rs.getString("email"));
				article.setNum(rs.getInt("num"));
				article.setPhone(rs.getString("phone"));
			}

		} catch (SQLException e) {
			System.out.println("selectArticle() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return article;
	}

	// MemberModifyPro // MemberCheck.me
	public boolean isIdCheck(String id) throws LoginException {
		boolean isIdCheckSuccess = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isIdCheckSuccess = true;
			} else {

			}
		} catch (SQLException e) {
			System.out.println("isIdCheck() ERROR! - " + e.getMessage());
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return isIdCheckSuccess;
	}

	public int dibsDelete(List<Integer> interNumList, String id) {
		System.out.println("bookDAO - dibsDelete");
		int isDeleteOk = 0;
		PreparedStatement pstmt = null;
		try {
			for (int i = 0; i < interNumList.size(); i++) {
				String sql = "delete from interestinglist where num=? and id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, interNumList.get(i));
				pstmt.setString(2, id);
				System.out.println(pstmt);
				isDeleteOk = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println("dibsDelete 오류!" + e.getMessage());
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return isDeleteOk;
	}

	// ========================================================================
	// MemberList calculating..
	// ========================================================================

	public JSONArray memberListCal() {
		System.out.println("MemberDAO - memberListCal");
		PreparedStatement pstmt = null;
		
		JSONArray opdetails = new JSONArray();
		try {
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;
			ResultSet rs4 = null;

			
			JSONObject opObjJoin = new JSONObject();
			JSONObject opObjCatg = new JSONObject();
			JSONObject opObjQna = new JSONObject();
			JSONObject opObjRental = new JSONObject();

			String query1 = "select catg, count(*) as catg_count from member group by catg;";
			PreparedStatement pstm1 = con.prepareStatement(query1);
			System.out.println("pstm1 : " + pstm1);
			String query2 = "select date, count(*) as id_count from member group by date;";
			PreparedStatement pstm2 = con.prepareStatement(query2);
			System.out.println("pstm2 : " + pstm2);
			String query3 = "select qna_genre, count(*) as qna_count from qna group by qna_genre;";
			PreparedStatement pstm3 = con.prepareStatement(query3);
			System.out.println("pstm3 : " + pstm3);
			String query4 = "select s_date, count(*) as retal_count from rental group by s_date;";
			PreparedStatement pstm4 = con.prepareStatement(query4);
			System.out.println("pstm4 : " + pstm4);
			
			rs1 = pstm1.executeQuery();
			rs2 = pstm2.executeQuery();
			rs3 = pstm3.executeQuery();
			rs4 = pstm4.executeQuery();


			while(rs1.next()) {
				opObjCatg = new JSONObject();
				String catg = rs1.getString("catg");
				int catg_count = rs1.getInt("catg_count");
				opObjCatg.put("catg", catg);
				opObjCatg.put("catg_count", catg_count);
				opdetails.add(opObjCatg);
			}
			while(rs2.next()) {
				opObjJoin = new JSONObject();
				String date = rs2.getString("date");
				int id_count = rs2.getInt("id_count");
				opObjJoin.put("date", date);
				opObjJoin.put("id_count", id_count);
				opdetails.add(opObjJoin);
			}
			while(rs3.next()) {
				opObjQna = new JSONObject();
				String qna_genre = rs3.getString("qna_genre");
				int qna_count = rs3.getInt("qna_count");
				opObjQna.put("qna_genre", qna_genre);
				opObjQna.put("qna_count", qna_count);
				opdetails.add(opObjQna);
				
			}
			while(rs4.next()) {
				opObjRental = new JSONObject();
				String s_date = rs4.getString("s_date");
				int retal_count = rs4.getInt("retal_count");
				opObjRental.put("s_date", s_date);
				opObjRental.put("retal_count", retal_count);
				opdetails.add(opObjRental);
			}
			System.out.println("opdetails.opObjCatg : "+opdetails.toString());
			System.out.println("opdetails.opObjJoin : "+opObjJoin.toString());
			System.out.println("opdetails.opObjQna : "+opObjQna.toString());
			System.out.println("opdetails.opObjRental : "+opObjRental.toString());
			System.out.println("responseObj : "+opdetails.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		System.out.println("MemberDAO - memberListCal 종료");
		return opdetails;
	}
}
