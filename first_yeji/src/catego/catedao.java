package catego;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class catedao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection con =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private static catedao dao;

	public static catedao getInstance() {
		if (dao ==null) {
			dao = new catedao();
		}
		return dao;
	}
	private catedao() {
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
	public int insert(String genre,String code) {
		int cnt=-1;
		getconn();
		String sql="insert into catego values(cate_s.nextval,?,?)";
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, genre);
			cnt =ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
				ps.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}
		return cnt;
	}
	public ArrayList<catebean> select() {
		ArrayList<catebean> list = new ArrayList<catebean>();
		getconn();
		String sql="select * from catego";
		try {
			ps =con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				int cnum =rs.getInt(1);
				String code = rs.getString(2);
				String genre =rs.getString(3);
				catebean bean = new catebean(cnum, code, genre);
				list.add(bean);
			}
		} catch (Exception e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}
	public int deleteCate(int cnum) {
		int cnt=-1;
		getconn();
		String sql = "delete from catego where cnum=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnum);
			cnt =ps.executeUpdate();
		} catch (Exception e) {
		}finally {
			try {
				if(ps!=null)
				ps.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}
		return cnt;
	}
	public int update(String genre,String code,int cnum) {
		int cnt=-1;
		getconn();
		String sql="update catego set genre=?,code=? where cnum =? ";
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, genre);
			ps.setString(2, code);
			ps.setInt(3, cnum);
			cnt =ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null)
				ps.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}
		return cnt;
	}
	public catebean selectone(int cnum1) {
		catebean bean=null;
		getconn();
		String sql="select * from catego where cnum=?";
		try {
			ps =con.prepareStatement(sql);
			ps.setInt(1, cnum1);
			rs = ps.executeQuery();
			while (rs.next()){
				int cnum =rs.getInt(1);
				String code = rs.getString(2);
				String genre =rs.getString(3);
				bean = new catebean(cnum, code, genre);
			}
		} catch (Exception e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
			}
		}
		return bean;
	}
}
