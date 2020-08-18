package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.oreilly.servlet.MultipartRequest;


public class productDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection con =null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	private static productDao dao;
	public static productDao getInstance() {
		if (dao==null) {
			dao=new productDao();
		}
		return dao;
	}
	private productDao() {
		try {
			Class.forName(driver);
		}catch(Exception e) {
		}
	}
	public void getcon() {
		try {
			con=DriverManager.getConnection(url, username, userpw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int insterprodu(MultipartRequest mr) {
		getcon();
		int cnt =-1;
		String pname = mr.getParameter("pname");
		String pcategory_fk = mr.getParameter("pcategory_fk");
		pcategory_fk += "_"+mr.getParameter("pcode");
		String pcompany = mr.getParameter("pcompany");
		String pimage = mr.getFilesystemName("pimage");
		int pqty = Integer.parseInt(mr.getParameter("pqty"));;
		int price = Integer.parseInt(mr.getParameter("price"));
		String pspec = mr.getParameter("pspec");
		String pcontents = mr.getParameter("pcontents");
		int point = Integer.parseInt(mr.getParameter("point"));
		String sql="insert into product(pnum,pname,pcategory_fk,pcompany,pimage,pqty,price,pspec,pcontents,point,pinputdate)"
				+ " values(catprod.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, pname);
			psmt.setString(2,pcategory_fk);
			psmt.setString(3, pcompany);
			psmt.setString(4, pimage);
			psmt.setInt(5, pqty);
			psmt.setInt(6, price);
			psmt.setString(7, pspec);
			psmt.setString(8, pcontents);
			psmt.setInt(9, point);
			Date d =new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf.format(d);
			psmt.setString(10, today);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt!=null)
					psmt.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return cnt;
	}
	public int updateprodu(MultipartRequest mr) {
		getcon();
		int cnt =-1;
		int pnum = Integer.parseInt(mr.getParameter("pnum"));
		String pcompany = mr.getParameter("pcompany");
		String pimage = mr.getFilesystemName("pimage");
		String old_pimage = mr.getParameter("old_pimage"); // 이전이미지.jpg
		int pqty = Integer.parseInt(mr.getParameter("pqty"));;
		int price = Integer.parseInt(mr.getParameter("price"));
		String pspec = mr.getParameter("pspec");
		String pcontents = mr.getParameter("pcontents");
		int point = Integer.parseInt(mr.getParameter("point"));
		if(pimage==null) {
			pimage=old_pimage;
		}
		String spl= "update product set pcompany=? ,pimage=? ,pqty=? ,price=? "
				+ ",pspec=? ,pcontents=? ,point=? where pnum=? ";

		try {
			psmt=con.prepareStatement(spl);
			psmt.setString(1, pcompany);
			psmt.setString(2, pimage);
			psmt.setInt(3, pqty);
			psmt.setInt(4, price);
			psmt.setString(5, pspec);
			psmt.setString(6, pcontents);
			psmt.setInt(7, point);
			psmt.setInt(8, pnum);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt!=null)
					psmt.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	public ArrayList<productBean> getallprodu() {
		ArrayList<productBean> list = new ArrayList<productBean>();
		getcon();
		String sql = "select * from product order by pnum";
		try {	
		psmt = con.prepareStatement(sql);
		rs = psmt.executeQuery();
		while (rs.next()) {
			 int pnum = rs.getInt(1);
			 String pname =rs.getString(2);
			 String pcategory_fk =rs.getString(3);
			 String pcompany =rs.getString(4);
			 String pimage =rs.getString(5);
			 int pqty= rs.getInt(6); 
			 int price= rs.getInt(7);
			 String pspec =rs.getString(8);
			 String pcontents =rs.getString(9);
			 int point= rs.getInt(10);
			 String pinputdate =rs.getString(11);
			productBean bean = new productBean(pnum, pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents, point, pinputdate,0,0,0);
			list.add(bean);
		}
		}catch(Exception e) {
			
		}finally {
			try {
				if(psmt!=null)
					psmt.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
public productBean selectproduct(int pnum1) {
productBean bean = null;
getcon();
String sql = "select * from product where pnum=?";
try {
	psmt = con.prepareStatement(sql);
	psmt.setInt(1, pnum1);
	rs=psmt.executeQuery();
	if(rs.next()) {
		 int pnum = rs.getInt(1);
		 String pname =rs.getString(2);
		 String pcategory_fk =rs.getString(3);
		 String pcompany =rs.getString(4);
		 String pimage =rs.getString(5);
		 int pqty= rs.getInt(6); 
		 int price= rs.getInt(7);
		 String pspec =rs.getString(8);
		 String pcontents =rs.getString(9);
		 int point= rs.getInt(10);
		 String pinputdate =rs.getString(11);
		bean = new productBean(pnum, pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents, point, pinputdate,0,0,0);
	}
} catch (SQLException e) {
}finally {
	try {
		if(psmt!=null)
			psmt.close();
		if(rs!=null)
			rs.close();
		if(con!=null)
			con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

return bean;
}

public ArrayList<productBean> MakeArraylist(ResultSet rs) {
	ArrayList<productBean> list = new ArrayList<productBean>();
	try {
		while (rs.next()) {
			 int pnum = rs.getInt(1);
			 String pname =rs.getString(2);
			 String pcategory_fk =rs.getString(3);
			 String pcompany =rs.getString(4);
			 String pimage =rs.getString(5);
			 int pqty= rs.getInt(6); 
			 int price= rs.getInt(7);
			 String pspec =rs.getString(8);
			 String pcontents =rs.getString(9);
			 int point= rs.getInt(10);
			 String pinputdate =rs.getString(11);
			productBean bean = new productBean(pnum, pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents, point, pinputdate,0,0,0);
			list.add(bean);
		}
	} catch (SQLException e) {
	}
	return list;
}
public int deleteprodu(int pnum) {
	getcon();
	int cnt = -1;
	String sql = "delete from product where pnum=?";
	try {
		psmt = con.prepareStatement(sql);
		psmt.setInt(1, pnum);
		cnt = psmt.executeUpdate();
	} catch (SQLException e) {
	}finally {
		try {
			if(psmt!=null)
				psmt.close();
			if(rs!=null)
				rs.close();
			if(con!=null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return cnt;
}
public ArrayList<productBean> getseletpro(int pnum) {
	ArrayList<productBean> list = new ArrayList<productBean>();
	getcon();
	String sql = "select * from product where pnum=?";
	try {
		psmt = con.prepareStatement(sql);
		psmt.setInt(1, pnum);
		rs = psmt.executeQuery();
		list=MakeArraylist(rs);
		
	} catch (SQLException e) {
	}finally {
		try {
			if(psmt!=null)
				psmt.close();
			if(con!=null)
				con.close();
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return list;
}


public int updatePimage(int pnum) {
	int cnt=-1;
	String sql="update product set pimage = null where pnum=?";
	getcon();
	try {
		psmt = con.prepareStatement(sql);
		psmt.setInt(1, pnum);
		cnt = psmt.executeUpdate();
	} catch (SQLException e) {
	}finally {
		try {
			if(psmt!=null)
				psmt.close();
			if(con!=null)
				con.close();
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return cnt;
}
public ArrayList<productBean> getSelectBySpe(String spec) {
	ArrayList<productBean> list = new ArrayList<productBean>();
	getcon();
	String sql = "select * from product where pspec=?";
	try {
		psmt = con.prepareStatement(sql);
		psmt.setString(1, spec);
		rs=psmt.executeQuery();
		while (rs.next()){
			 int pnum = rs.getInt(1);
			 String pname =rs.getString(2);
			 String pcategory_fk =rs.getString(3);
			 String pcompany =rs.getString(4);
			 String pimage =rs.getString(5);
			 int pqty= rs.getInt(6); 
			 int price= rs.getInt(7);
			 String pspec =rs.getString(8);
			 String pcontents =rs.getString(9);
			 int point= rs.getInt(10);
			 String pinputdate =rs.getString(11);
			productBean bean = new productBean(pnum, pname, pcategory_fk, pcompany, pimage, pqty, price, pspec, pcontents, point, pinputdate,0,0,0);
			list.add(bean);
		}
	} catch (SQLException e) {
	}finally {
		try {
			if(psmt!=null)
				psmt.close();
			if(con!=null)
				con.close();
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return list;
}
public ArrayList<productBean> getSelectBySpe(String code,String cgname) {
	ArrayList<productBean> list = new ArrayList<productBean>();
	getcon();
	String sql = "select * from product where pcategory_fk like ?";  //'"+code+"%'"
	try {
		psmt = con.prepareStatement(sql);
		psmt.setString(1, "%"+code+"%");
		rs=psmt.executeQuery();

		list=MakeArraylist(rs);
		
	} catch (SQLException e) {
	}finally {
		try {
			if(psmt!=null)
				psmt.close();
			if(con!=null)
				con.close();
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return list;
}

}



