package vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberBean {
	private int num;
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String catg;
	private int age;
	private String address;
	private Timestamp date;
	private String state;
	
	public MemberBean() {}
	
	public MemberBean(int num, String id, String name, String password, String email, String phone, String catg,
			int age, String address, Timestamp date,String status) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.catg = catg;
		this.age = age;
		this.address = address;
		this.date = date;
		this.state = status;
	}
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCatg() {
		return catg;
	}
	public void setCatg(String catg) {
		this.catg = catg;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
