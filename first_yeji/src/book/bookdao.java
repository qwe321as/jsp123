package book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.oreilly.servlet.MultipartRequest;
public class bookdao {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String userpw = "jsppw";

	PreparedStatement ps = null;
	ResultSet rs =null;
	Connection con = null;
	private static bookdao dao;
	public static bookdao getInstance() {
		if (dao==null) {
			dao=new bookdao();
		}
		return dao;
	}
	private bookdao() {
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
	public int insert(MultipartRequest mr) {
		getConn();
		int cnt=-1;
		String title=mr.getParameter("title");
		String author=mr.getParameter("author");
		String publisher=mr.getParameter("publisher");
		String genre=mr.getParameter("genre");
		String bimage=mr.getFilesystemName("bimage");
		String bcontents=mr.getFilesystemName("bcontents");
		String sql="insert into book(bnum,title,author,publisher,genre,bimage,bcontents)"
				+ " values(book_s.nextval,?,?,?,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2,author);
			ps.setString(3, publisher);
			ps.setString(4, genre);
			ps.setString(5, bimage);
			ps.setString(6, bcontents);
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
	public ArrayList<bookbean>  getall() {
		ArrayList<bookbean> list = new ArrayList<bookbean>();
		getConn();
		String sql = "select * from book";
		try {	
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while (rs.next()) {
			 int bnum = rs.getInt(1);
			 String title =rs.getString(2);
			 String author =rs.getString(3);
			 String publisher =rs.getString(4);
			 String genre =rs.getString(5);
			 String bimage= rs.getString(6); 
			 String pcontents= rs.getString(7);
			 bookbean bean = new bookbean(bnum, title, author, publisher, genre, bimage, pcontents);
			list.add(bean);
		}
		}catch(Exception e) {
			
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
	public bookbean selectone(int bnum1) {
		bookbean bean = null;
		getConn();
		String sql = "select * from book where bnum=?";
		try {	
			ps = con.prepareStatement(sql);
			ps.setInt(1, bnum1);
			rs = ps.executeQuery();
			while (rs.next()) {
				int bnum = rs.getInt(1);
				String title =rs.getString(2);
				String author =rs.getString(3);
				String publisher =rs.getString(4);
				String genre =rs.getString(5);
				String bimage= rs.getString(6); 
				String pcontents= rs.getString(7);
				bean = new bookbean(bnum, title, author, publisher, genre, bimage, pcontents);
			}
		}catch(Exception e) {
			
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
		return bean;
	}
	public int  deleteBook(int bnum) {
		int cnt=-1;
		getConn();
		String sql ="delete from book where bnum=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, bnum);
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

}

