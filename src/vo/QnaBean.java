package vo;

import java.sql.Date;
import java.sql.Timestamp;

public class QnaBean {
	private int board_num;
	private String id;
	private String pass;
	private String title;
	private String content;
//	private String comment;
	private String qna_genre;
	private Date date;
	
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
//	public String getComment() {
//		return comment;
//	}
//	public void setComment(String comment) {
//		this.comment = comment;
//	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String subject) {
		this.title = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String comment) {
		this.content = comment;
	}
	public String getQna_genre() {
		return qna_genre;
	}
	public void setQna_genre(String qna_genre) {
		this.qna_genre = qna_genre;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
