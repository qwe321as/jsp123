package login;
public class loginbean {
	private int	no;
	private String name;
	private String id;
	private String password;
	private String email;
	public loginbean(int no, String name, String id, String password, String email) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.password = password;
		this.email = email;
	}
	public loginbean() {
		
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
