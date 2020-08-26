package gonji;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import com.oreilly.servlet.MultipartRequest;

import catego.catebean;
public class gonjidao {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String userpw = "jsppw";

	PreparedStatement ps = null;
	ResultSet rs =null;
	Connection con = null;
	private static gonjidao dao;
	public static gonjidao getInstance() {
		if (dao==null) {
			dao=new gonjidao();
		}
		return dao;
	}
	private gonjidao() {
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
	public int insert(gonjibean bean) {
		getConn();
		int cnt=-1;
		String sql="insert into gonji values(gonji_s.nextval,?,?,?,'°ü¸®ÀÚ')";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, bean.getTitle());
			ps.setString(2,bean.getContent());
			ps.setTimestamp(3, bean.getReg_date());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
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
	public ArrayList<gonjibean> getall() {
		ArrayList<gonjibean> list = new ArrayList<gonjibean>();
		getConn();
		String sql = "select * from gonji";
		try {	
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int num = rs.getInt(1);
				String title =rs.getString(2);
				String content =rs.getString(3);
				Timestamp reg_date = rs.getTimestamp(4);
				String writer =rs.getString(5);
				gonjibean bean = new gonjibean(num, title, content, reg_date, writer);
				list.add(bean);
			}
		}
		catch(Exception e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
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

	public int delete(int num) {
		int cnt=-1;
		getConn();
		String sql ="delete from gonji where num=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			cnt=ps.executeUpdate();
		} catch (Exception e) {
		}finally {
			try {
				if(ps!=null)
					ps.close();
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


public int update(gonjibean bean) {
	int cnt=-1;
	getConn();
	String sql="update gonji set title=?, content=? where num =? ";
	try {
		ps =con.prepareStatement(sql);
		ps.setString(1, bean.getTitle());
		ps.setString(2, bean.getContent());
		ps.setInt(3, bean.getNum());
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
public gonjibean selectone(int num1) {
	gonjibean bean=null;
	getConn();
	String sql="select * from gonji where num=?";
	try {
		ps =con.prepareStatement(sql);
		ps.setInt(1, num1);
		rs = ps.executeQuery();
		while (rs.next()){
			int num = rs.getInt(1);
			String title =rs.getString(2);
			String content =rs.getString(3);
			Timestamp reg_date = rs.getTimestamp(4);
			String writer =rs.getString(5);
			bean = new gonjibean(num, title, content, reg_date, writer);
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

