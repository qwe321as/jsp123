package my.shop.mall;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.shop.productBean;

public class OrdersDao {
	private DataSource ds;
	Connection con =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public OrdersDao() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			con=ds.getConnection();
			System.out.println("연결성공");
		} catch (Exception e) {
			System.out.println("연결실패");
		}

	}

	public int insertOrders(int no,Vector <productBean> cv) {
		String sql = "insert into orders values (orderseq.nextval,?,?,?,?)";
		int cnt =-1;
		try {
			for (int i = 0; i < cv.size(); i++) {
				ps = con.prepareStatement(sql);
				ps.setInt(1, no);
				ps.setInt(2, cv.get(i).getPnum());
				ps.setInt(3, cv.get(i).getPqty());
				ps.setInt(4, cv.get(i).getTotalPrice());
				cnt +=ps.executeUpdate();
			}
		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			/* con은 닫으면 더이상 연결안됨 */
		}
		return cnt;
	}
	public Vector<OrdersBean> getOrderList(String memid) {
		Vector<OrdersBean> list = new Vector<OrdersBean>();
		String sql = "select m.name mname,m.id mid,p.pname pname,o.qty qty,o.amount amount "
				+ "from(members m join orders o on m.no=o.memno) "
				+ "join product p on o.pnum=p.pnum where m.id=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, memid);
			rs = ps.executeQuery();
			while(rs.next()) {
				String mname = rs.getString("mname");
				String mid = rs.getString("mid");
				String pname = rs.getString("pname");
				int qty = rs.getInt("qty");
				int amount = rs.getInt("amount");
				OrdersBean baen = new OrdersBean(mname, mid, pname, qty, amount);
				list.add(baen);
			}
		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
				ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
