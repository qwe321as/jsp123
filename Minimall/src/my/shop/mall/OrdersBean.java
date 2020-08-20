package my.shop.mall;

public class OrdersBean {

	private String mname;
	private String mid;
	private String pname;
	private int qty;
	private int amount;
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public OrdersBean(String mname, String mid, String pname, int qty, int amount) {
		super();
		this.mname = mname;
		this.mid = mid;
		this.pname = pname;
		this.qty = qty;
		this.amount = amount;
	}
	public OrdersBean() {
		
	}
}
