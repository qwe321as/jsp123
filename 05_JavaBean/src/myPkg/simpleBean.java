package myPkg;

public class simpleBean {
	public simpleBean(String msg){

		System.out.println("simpleBean(string msg)");

	}


	public simpleBean(){

		System.out.println("simpleBean()");

	}

	private String msg;

	public  String getMsg() {
		return msg;
	}
	public  void setMsg(String msg) {
		this.msg=msg;

	}

}
