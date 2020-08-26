package book;

public class bookbean {
	private int bnum;
	private String title;
	private String author;
	private String publisher;
	private String genre;
	private String bimage;
	private String pcontents;
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
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

	public bookbean(int bnum, String title, String author, String publisher, String genre, String bimage,
			String pcontents) {
		super();
		this.bnum = bnum;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.genre = genre;
		this.bimage = bimage;
		this.pcontents = pcontents;
	}
	
	public bookbean() {
		
	}	
}
