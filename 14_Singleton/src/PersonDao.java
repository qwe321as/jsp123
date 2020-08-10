
public class PersonDao {
	private static PersonDao per;
	
	public static PersonDao getInstance() {
		if (per == null) {
			per = new PersonDao();
		}
		return per;
	}
	
	
	private PersonDao() {
		System.out.println("객체생성");
	}
}
//singletin 패턴 객체 만드는 규칙
//1.생성자는 private
//2.생성된 객체를 리턴하는 메서드를 static 매서드를 만든다(getInstance).
//3.현재(자기)클래스 타입의 변수를 만든다.(per)
//객체 두개생성할수없게 하는것
