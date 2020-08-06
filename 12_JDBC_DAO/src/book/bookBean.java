package book;

public class bookBean {
private int num;
private String title;
private String author;
private String publisher;
private int price;
private String buy;
private String kind;
private String bookstore;
private String count;
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getPublisher() {
	return publisher;
}
public void setPublisher(String publisher) {
	this.publisher = publisher;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getBuy() {
	return buy;
}
public void setBuy(String buy) {
	this.buy = buy;
}
public String getKind() {
	return kind;
}
public void setKind(String kind) {
	this.kind = kind;
}
public String getBookstore() {
	return bookstore;
}
public void setBookstore(String bookstore) {
	this.bookstore = bookstore;
}
public String getCount() {
	return count;
}
public void setCount(String count) {
	this.count = count;
}
public bookBean(int num, String title, String author, String publisher, int price, String buy, String kind,
		String bookstore, String count) {
	super();
	this.num = num;
	this.title = title;
	this.author = author;
	this.publisher = publisher;
	this.price = price;
	this.buy = buy;
	this.kind = kind;
	this.bookstore = bookstore;
	this.count = count;
}

public bookBean(){
	
	
}

}
