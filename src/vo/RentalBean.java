package vo;

import java.sql.Date;

public class RentalBean {

	private int num;
	private String isbn;
	private String id;
	private Date s_date;
	private Date onrental_date;
	private Date e_date;
	
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOnrental_date() {
		return onrental_date;
	}
	public void setOnrental_date(Date onrental_date) {
		this.onrental_date = onrental_date;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	
	
}
