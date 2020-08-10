
public class PersonMain {
public static void main(String[] args) {
	//PersonDao p1 = new PersonDao();
	//PersonDao p2 = new PersonDao();
	PersonDao p1 = PersonDao.getInstance();
	PersonDao p2 = PersonDao.getInstance(); //프라이빗을 호출하기위해 
	
	
	System.out.println("p1:"+p1);
	System.out.println("p2:"+p2);
	
	
}

}
