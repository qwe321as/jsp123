package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection con =null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	private static CategoryDao dao;

	public static CategoryDao getInstance() {
		if (dao ==null) {
			dao = new CategoryDao();
		}
		return dao;
	}
	private CategoryDao() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
		}
	}
	public  void getconn() {
		try {
			con = DriverManager.getConnection(url, username, userpw);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	public int getinsterChar(String code,String cname) {
		int cnt=-1;
		getconn();
		String sql = "insert into category values(catseq.nextval,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, code);
			psmt.setString(2, cname);
			cnt=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(psmt!=null)
					psmt.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return cnt;
	}
public ArrayList<CategoryBean> getselectCa() {
	ArrayList<CategoryBean> list = new ArrayList<CategoryBean>();
	getconn();
	String sql = "select * from category order by cnum asc";
	try {
		psmt = con.prepareStatement(sql);
		rs = psmt.executeQuery();
		while (rs.next()){
			int cnum = rs.getInt(1);
			String code =rs.getString(2);
			String cname=rs.getString(3);
			CategoryBean cbean = new CategoryBean(cnum, code, cname);
			list.add(cbean);
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
public int deleteCate(int cnum) {
	int cnt=-1;
	getconn();
	String sql ="delete from category where cnum=?";
	try {
		psmt = con.prepareStatement(sql);
		psmt.setInt(1, cnum);
		cnt = psmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
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

public CategoryBean cateselecte(int cnum1) {
	CategoryBean bean = null;
	getconn();
	String sql ="select * from category where cnum=?";
	try {
		psmt=con.prepareStatement(sql);
		psmt.setInt(1, cnum1);
		rs = psmt.executeQuery();
		if(rs.next()) {
			int cnum = rs.getInt("cnum");
			String code =rs.getString("code");
			String cname=rs.getString("cname");
			 bean = new CategoryBean(cnum, code, cname); 
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
	
	return bean;
}
public int updateCa(int cnum, String cname) {
	int cnt=-1;
	getconn();
	String sql ="update category set cname=? where cnum=?";
	try {
		psmt = con.prepareStatement(sql);
		psmt.setString(1, cname);
		psmt.setInt(2, cnum);
		cnt=psmt.executeUpdate();
	} catch (SQLException e) {
	}finally {
		try {
			if(psmt!=null)
				psmt.close();
			if(con!=null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return cnt;
}
}
