package my.shop.mall;
import java.util.ArrayList;
import java.util.Vector;
import my.shop.productBean;
import my.shop.productDao;

public class CartBean {
	private Vector<productBean> clist;
	public CartBean() {
		clist = new Vector<productBean>();//장바구니 역할을 함

	}
	public void addProduct(int pnum,int oqty) {
		productDao pdao = productDao.getInstance();
		ArrayList<productBean> list2 = pdao.getseletpro(pnum);
		for (int i = 0; i < clist.size(); i++) {
			if (clist.get(i).getPnum()==pnum ) {//장바구니에 이미 담겨있을때
				clist.get(i).setPqty(clist.get(i).getPqty()+oqty);
				clist.get(i).setTotalPoint(clist.get(i).getPoint()*clist.get(i).getPqty());
				clist.get(i).setTotalPrice(clist.get(i).getPrice()*clist.get(i).getPqty());
				return;
			}

		}
		//장바구니에 없는 새상품일떄
		list2.get(0).setPqty(oqty);
		int totalprice = list2.get(0).getPqty()*list2.get(0).getPrice();
		int totalpoint= list2.get(0).getPqty()*list2.get(0).getPoint();
		list2.get(0).setTotalPoint(totalpoint);
		list2.get(0).setTotalPrice(totalprice);

		clist.add(list2.get(0));
		for (int i = 0; i < clist.size(); i++) {
			System.out.println(clist.get(i).getTotalPoint()+","+clist.get(i).getPname()+","+clist.get(i).getPqty());
		}

	}

	/*
	 * public void setEdit(int pnum,int oqty) { for (int i = 0; i <
	 * clist.size(); i++) { if (clist.get(i).getPnum()==pnum ) {//장바구니에 이미 담겨있을때
	 * clist.get(i).setPqty(oqty);
	 * clist.get(i).setTotalPoint(clist.get(i).getPoint()*clist.get(i).getPqty());
	 * clist.get(i).setTotalPrice(clist.get(i).getPrice()*clist.get(i).getPqty());
	 * return; }
	 * }
	 * }
	 */
	public Vector<productBean> getAllProducts(){
		return clist;
	}
	public void setEdit(int pnum,int oqty){

		for( productBean pb : clist) {
			if(pb.getPnum() == pnum) {
				if(oqty == 0) {
					clist.removeElement(pb);
					break;
				}
				else {
					pb.setPqty(oqty);

					int price = pb.getPrice() * oqty;
					int point = pb.getPoint() * oqty;

					pb.setTotalPrice(price);
					pb.setTotalPoint(point);
					break;
				}
			}
		}
	}//setEdit
	public void remove(int pnum) {
		if(clist.get(0).getPnum()==pnum) {
			clist.removeElement(clist.get(0));
		}
	}

}
