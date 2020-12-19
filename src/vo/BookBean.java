package vo;

import java.sql.Date;

public class BookBean {
		private int num;
	    private String title;
	    private String image;
	    private String author;
	    private String publisher;
	    private String pubdate;
	    private String isbn;
	    private String description;
	    private String catg1;
		private String catg2;
	    private String state;
	    private Date date;
		private int count;
	    private String author_info;
	    private String index;
	    private int reviewCount;
	    private int starcount;
	    
	    public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
	    public String getTitle() {
	        return title;
	    }
	    public void setTitle(String title) {
	        this.title = title;
	    }
	    public String getImage() {
	        return image;
	    }
	    public void setImage(String image) {
	        this.image = image;
	    }
	    public String getAuthor() {
	        return author;
	    }
	    public void setAuthor(String author) {
	        this.author = author;
	    }
	    public String getPublisher() {
	        return publisher;
	    }
	    public void setPublisher(String publisher) {
	        this.publisher = publisher;
	    }
	    public String getPubdate() {
	        return pubdate;
	    }
	    public void setPubdate(String pubdate) {
	        this.pubdate = pubdate;
	    }
	    public String getIsbn() {
	        return isbn;
	    }
	    public void setIsbn(String isbn) {
	        this.isbn = isbn;
	    }
	    public String getDescription() {
	        return description;
	    }
	    public void setDescription(String description) {
	        this.description = description;
	    }

	    public String getCatg1() {
			return catg1;
		}
		public void setCatg1(String catg1) {
			this.catg1 = catg1;
		}
		public String getCatg2() {
			return catg2;
		}
		public void setCatg2(String catg2) {
			this.catg2 = catg2;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public int getCount() {
			return count;
		}
	    public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public String getAuthor_info() {
			return author_info;
		}
		public void setAuthor_info(String author_info) {
			this.author_info = author_info;
		}
		public String getIndex() {
			return index;
		}
		public void setIndex(String index) {
			this.index = index;
		}
		public int getReviewCount() {
			return reviewCount;
		}
		public void setReviewCount(int reviewCount) {
			this.reviewCount = reviewCount;
		}
		public int getStarcount() {
			return starcount;
		}
		public void setStarcount(int starcount) {
			this.starcount = starcount;
		}
}
