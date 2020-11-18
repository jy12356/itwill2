package vo;

import java.sql.Date;

public class ReviewBean {

	private int num; // 리뷰 번호
	private String id; // 리뷰 작성자
	private String content; // 리뷰 내용
	private Date date; // 리뷰 작성일
	private int starcount; // 별점 Count
	private int likecount; // 좋아요 Count
	private String isbn; // 도서 게시물 코드
	private int spoiler; // 스포일러 포함 여부
		
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getStarcount() {
		return starcount;
	}
	public void setStarcount(int starcount) {
		this.starcount = starcount;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getSpoiler() {
		return spoiler;
	}
	public void setSpoiler(int spoiler) {
		this.spoiler = spoiler;
	}
	
	
	
	
}
