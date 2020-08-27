package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class logindao {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String userpw = "jsppw";

	PreparedStatement ps = null;
	ResultSet rs =null;
	Connection con = null;
	private static logindao dao;
	public static logindao getInstance() {
		if (dao==null) {
			dao=new logindao();
		}
		return dao;
	}
	private logindao() {
		System.out.println("boardDao()");
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
		}
	}
	public void getConn() {
		try {
			con = DriverManager.getConnection(url, user, userpw);
		} catch (SQLException e) {
		}
	}
	public boolean findid(String id) {
		boolean flag=false;
		System.out.println(id);
		getConn();
		String sql = "select * from login where id =?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				flag=true;
			}
		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}
		return flag;
	}
	public int insertid(loginbean bean) {
		int cnt = -1;
		getConn();
		String sql = "insert into login values(mem_s.nextval,?,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getId());
			ps.setString(3, bean.getPassword());
			ps.setString(4, bean.getEmail());
			cnt = ps.executeUpdate();

		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}

		return cnt;

	}
	public int delete(String id) {
		int cnt = -1;
		getConn();
		String sql = "delete login where id=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}
		
		return cnt;
		
	}
	public loginbean getMemberInfo(String id1, String password1) {
		loginbean bean =null;
		getConn();
		String sql = "select * from login where id=? and password=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id1);
			ps.setString(2, password1);
			rs = ps.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String email = rs.getString("email");
				bean = new loginbean(no, name, id, password, email);
			}
		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}

		return bean;

	}

	public String findpw(String id1,String email1) {
		getConn();
		String pw="";
		String sql = "select * from login where id=? and email=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id1);
			ps.setString(2, email1);
			rs = ps.executeQuery();
			if (rs.next()) {
				 pw = rs.getNString("password");
			}
		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}
		return pw;
	}
	public String findid(String name1,String email1) {
		getConn();
		String id="";
		String sql = "select * from login where name=? and email=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name1);
			ps.setString(2, email1);
			rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getNString("id");
			}
		} catch (SQLException e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
			}
		}
		return id;
	}
	public ArrayList<loginbean> select() {
		getConn();
		ArrayList<loginbean> list=new ArrayList<loginbean>();
		String sql="select * from login";
		try {
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String email = rs.getString("email");
				loginbean bean = new loginbean(no, name, id, password, email);
				list.add(bean);
			}
		} catch (Exception e) {
		}
		return list;
	}
	}
