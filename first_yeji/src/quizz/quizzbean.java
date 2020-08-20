package quizz;

public class quizzbean {
	private int qnum;
	private String qcategory;
	private String question;
	private String answer;
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQcategory() {
		return qcategory;
	}
	public void setQcategory(String qcategory) {
		this.qcategory = qcategory;
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
	public quizzbean(int qnum, String qcategory, String question, String answer) {
		super();
		this.qnum = qnum;
		this.qcategory = qcategory;
		this.question = question;
		this.answer = answer;
	}
	public quizzbean() {
		
	}
}
