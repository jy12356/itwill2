package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static db.JdbcUtil.*;

import vo.BookBean;
import vo.MsgBean;

public class MsgDAO {

	// **Singleton Pattern
	
	// 외부에서 인스턴트 생성 불가능 하도록 private
	private MsgDAO() {};
	
	// private 으로 설정해서 외부에서 접근 불가능
	// 생성자를 리턴하는 getInstance()에서 멤버변수에 접근 가능하도록 static으로 지정
	private static MsgDAO instance =  new MsgDAO();
	
	// 생성된 instance를 외부로 리턴하기위해 Getter -> getInstance() 정의
	// 외부에 인스턴스 생성없이 접근 가능하도록 static으로 정의
	public static MsgDAO getInstance() {
		return instance;
	}
	
//---------------------------------------------------------------------------
	
	Connection con; // Connection 객체를 전달받아 저장할 멤버변수
	
	// Service 클래스로부터 Connection 객체를 전달받아 멤버변수에 저장하는 메서드
	public void setConnection(Connection con) {
		this.con = con;
	}
	
//---------------------------------------------------------------------------

	
	// ---------------GET---------------
	public ArrayList<MsgBean> myMsgList(int page, int limit, String id) {
		System.out.println("DAO - myMsgList()");

		ArrayList<MsgBean> msglist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			msglist = new ArrayList<MsgBean>();
			String sql = "select * from message where id=? order by date desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, page);
			pstmt.setInt(3, limit);
			System.out.println(pstmt);
			rs= pstmt.executeQuery();		
			while(rs.next()) {
				MsgBean msgBean = new MsgBean();
				msgBean.setNum(rs.getInt("num"));
				msgBean.setContent(rs.getString("content"));
				msgBean.setId(rs.getString("id"));
				msgBean.setDate(rs.getDate("date"));
				msgBean.setIsRead(rs.getString("isRead"));
				msgBean.setFromId(rs.getString("fromId"));
				msglist.add(msgBean);
				
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return msglist;
	}
	public MsgBean getMyMsg(int num, String id) {
		System.out.println("DAO - getMyMsg()");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MsgBean msgBean = new MsgBean();
		try {			
			String sql = "select * from message where id=? and num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			rs= pstmt.executeQuery();		
			while(rs.next()) {
				msgBean.setNum(rs.getInt("num"));
				msgBean.setContent(rs.getString("content"));
				msgBean.setId(rs.getString("id"));
				msgBean.setDate(rs.getDate("date"));
				msgBean.setIsRead(rs.getString("isRead"));				
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return msgBean;
	}
	public int myMsgListCount(String id) {
		System.out.println("DAO - myMsgListCount()");
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {			
			String sql = "select count(*) from message where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();		
			if(rs.next()) {
				listCount = rs.getInt(1);				
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}
	// ---------------INSERT---------------
	public int insertMsg(MsgBean msgBean) {

		System.out.println("DAO - insertMsg()");
		int insertCount = 0; 
		int num = 0;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			
			String sql = "select max(num) from message";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1; 
			}
			
			sql = "insert into message(num, content, id, date, isRead,fromId) values(?,?,?,sysdate(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, msgBean.getContent());
			pstmt.setString(3, msgBean.getId());
			pstmt.setString(4, "n");			
			pstmt.setString(5, msgBean.getFromId());			
			insertCount = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return insertCount;
	}
			
	// ---------------UPDATE---------------
	
	public int updateStatus(String id, int num) {
		System.out.println("DAO - updateStatus()");

		PreparedStatement pstmt = null;
		int updateStatus = 0;
		String sql = null;
		
		try {
			
			sql = "update notice set isRead=y where id=? and num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  id);
			pstmt.setInt(2,  num);
			updateStatus = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateStatus;
	}

	public int deleteMsg(List<Integer> msgNumList, String id) {
		System.out.println("bookDAO - dibsDelete");
	      int isDeleteOk = 0;
	      PreparedStatement pstmt = null;
	      try {
	         for(int i=0; i< msgNumList.size(); i++) {
	            String sql = "delete from message where num=? and id=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, msgNumList.get(i));
	            pstmt.setString(2,id);
	            System.out.println(pstmt);
	            isDeleteOk = pstmt.executeUpdate();
	         }
	      }catch (Exception e) {
	         System.out.println("deleteMsg 오류!" + e.getMessage());
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      return isDeleteOk;
	}
	
			
}







