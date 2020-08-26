package gonji;

import java.sql.Timestamp;
public class gonjibean {
	private int num;
	private String title;
	private String content;
	private Timestamp reg_date;
	private String writer;

	public int getNum() {
		return num;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public String getWriter() {
		return writer;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public gonjibean() {
		
	}	
	public gonjibean(int num, String title, String content, Timestamp reg_date, String writer) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.writer = writer;
	}
}
