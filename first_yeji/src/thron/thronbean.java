package thron;

public class thronbean {
	private int num;
	private String subject;
	private String genre;

	public thronbean(int num, String subject, String genre) {
		super();
		this.num = num;
		this.subject = subject;
		this.genre = genre;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public thronbean() {
		
	}
	
}
