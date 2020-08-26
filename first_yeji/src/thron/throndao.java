package thron;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class throndao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection con =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private static throndao dao;

	public static throndao getInstance() {
		if (dao ==null) {
			dao = new throndao();
		}
		return dao;
	}
	private throndao() {
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
	public int insert(String genre,String subject) {
		int cnt=-1;
		getconn();
		String sql="insert into thoron values(thoron_s.nextval,?,?)";
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, subject);
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
	public ArrayList<thronbean> select() {
		ArrayList<thronbean> list = new ArrayList<thronbean>();
		getconn();
		String sql="select * from thoron";
		try {
			ps =con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				int num =rs.getInt(1);
				String subject = rs.getString(2);
				String genre =rs.getString(3);
				thronbean bean = new thronbean(num, subject, genre);
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
	public int delete(int num) {
		int cnt=-1;
		getconn();
		String sql = "delete from thoron where num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
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
	public int update(String genre,String subject,int num) {
		int cnt=-1;
		getconn();
		String sql="update thoron set genre=?,subject=? where num =? ";
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, genre);
			ps.setString(2, subject);
			ps.setInt(3, num);
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
	public thronbean selectone(int num1) {
		thronbean bean=null;
		getconn();
		String sql="select * from thoron where num=?";
		try {
			ps =con.prepareStatement(sql);
			ps.setInt(1, num1);
			rs = ps.executeQuery();
			while (rs.next()){
				int num =rs.getInt(1);
				String subject = rs.getString(2);
				String genre =rs.getString(3);
				bean = new thronbean(num, subject, genre);
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
