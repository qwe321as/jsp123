package quizz;

public class quizzbean {
	private int qnum;
	private String book;
	private String question;
	private String answer;
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public quizzbean(int qnum, String book, String question, String answer) {
		super();
		this.qnum = qnum;
		this.question = question;
		this.answer = answer;
		this.book= book;
	}
	public quizzbean() {
		
	}
}
