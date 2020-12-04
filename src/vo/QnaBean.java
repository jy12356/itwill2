package vo;

import java.sql.Date;
import java.sql.Timestamp;

public class QnaBean {
	private int board_num;
	private String id;
	private String pass;
	private String title;
	private String content;
	private String qna_genre;
	private Date date;
	private int re_ref;
	private int re_lev;
	private int re_seq;
	private String content2;
	
	
	
	
	
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
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
