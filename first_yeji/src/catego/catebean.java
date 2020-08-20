package catego;

public class catebean {
	private int cnum;
	private String code;
	private String genre;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public catebean(int cnum, String code, String genre) {
		super();
		this.cnum = cnum;
		this.code = code;
		this.genre = genre;
	}
	public catebean() {
		
	}
	
}
