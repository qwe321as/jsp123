import java.sql.Date;

public class Dao {
	create table members(
			private int no;
			private String name;
			private String id ;
			private String password ;
			private String rrn1 ;
			private String rrn2 ;
			private String email ;
			private String hp1 ;
			private String hp2 ;
			private String hp3 ;
			private String joindate ;
		);

	

create table category(
	private int cnum ;
	private String code;
	private String cname;
);

create table product(
		private int pnum;
		private String pname ;
		private String pcategory_fk;
		private String pcompany;
		private String pimage;
		private int pqty; 
		private int price;
		private String pspec;
		private String pcontents;
		private int point;
		private String pinputdate;
	);

create table orders(
		private int orderId;
		private int memno;
		private int pnum;
		private int qty;
		private int amount;
	);
create table board(
		private int num;
		private String writer;
		private String email;
		private String subject;
		private String passwd;
		private Date reg_date;
		private int readcount;
		private int ref;
		private int re_step;
		private int re_level;
		private String content;
		private String ip;
	);

}
