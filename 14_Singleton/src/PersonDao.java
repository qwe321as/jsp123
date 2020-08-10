
public class PersonDao {
	private static PersonDao per;
	
	public static PersonDao getInstance() {
		if (per == null) {
			per = new PersonDao();
		}
		return per;
	}
	
	
	private PersonDao() {
		System.out.println("��ü����");
	}
}
//singletin ���� ��ü ����� ��Ģ
//1.�����ڴ� private
//2.������ ��ü�� �����ϴ� �޼��带 static �ż��带 �����(getInstance).
//3.����(�ڱ�)Ŭ���� Ÿ���� ������ �����.(per)
//��ü �ΰ������Ҽ����� �ϴ°�
