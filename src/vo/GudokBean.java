package vo;

import java.sql.Date;

public class GudokBean {
	private int gnum;
	private String gproduct;
	private Date date;
	private String id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public String getGproduct() {
		return gproduct;
	}
	public void setGproduct(String gproduct) {
		this.gproduct = gproduct;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
	
