package Movie;

public class MovieBean {
private String num;
private	String id;
private	String name;
private int	age;
private String genre;
private String time;
private int partner;
private String memo;
public MovieBean(String num, String id, String name, int age, String genre, String time, int partner, String memo) {
	super();
	this.num = num;
	this.id = id;
	this.name = name;
	this.age = age;
	this.genre = genre;
	this.time = time;
	this.partner = partner;
	this.memo = memo;
}

public MovieBean(){
	
}

public String getNum() {
	return num;
}

public void setNum(String num) {
	this.num = num;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public int getAge() {
	return age;
}

public void setAge(int age) {
	this.age = age;
}

public String getGenre() {
	return genre;
}

public void setGenre(String genre) {
	this.genre = genre;
}

public String getTime() {
	return time;
}

public void setTime(String time) {
	this.time = time;
}

public int getPartner() {
	return partner;
}

public void setPartner(int partner) {
	this.partner = partner;
}

public String getMemo() {
	return memo;
}

public void setMemo(String memo) {
	this.memo = memo;
}

}
