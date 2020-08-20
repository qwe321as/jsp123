package book;

public class bookbean {
	private int bnum;
	private String title;
	private String author;
	private String publisher;
	private String bcategory;
	private String bimage;
	private String pcontents;
	private String bpasswd;
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public String getBpasswd() {
		return bpasswd;
	}
	public void setBpasswd(String bpasswd) {
		this.bpasswd = bpasswd;
	}
	public bookbean(int bnum, String title, String author, String publisher, String bcategory, String bimage,
			String pcontents, String bpasswd) {
		super();
		this.bnum = bnum;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.bcategory = bcategory;
		this.bimage = bimage;
		this.pcontents = pcontents;
		this.bpasswd = bpasswd;
	}
	
	public bookbean() {
		
	}	
}
