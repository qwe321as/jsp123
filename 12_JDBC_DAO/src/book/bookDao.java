package book;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class bookDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="jspid";
	String userpw = "jsppw";
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;

	public bookDao(){
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩실패");
		}

	}
	public void getcon(){
		try {
			con = DriverManager.getConnection(url, user, userpw);
		} catch (SQLException e) {
			System.out.println("연결실패");
		}
	}
	public ArrayList<bookBean> getAllbook(){
		ArrayList<bookBean> list = new ArrayList<bookBean>();
		String sql = "select * from book";
		getcon();

		try{ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			int num = rs.getInt("num");
			String title = rs.getString("title");
			String author =rs.getString("author");
			String publisher = rs.getString("publisher");
			int price = rs.getInt("price");
			String buy = rs.getString("buy");
			String kind = rs.getString("kind");
			String bookstore = rs.getString("bookstore");
			String count = rs.getString("count");
			bookBean bean = new bookBean(num, title, author, publisher, price, buy, kind, bookstore, count);
			list.add(bean);

		}}catch(Exception e) {

		}finally {
			try {
				if(con != null) {
					con.close();}
				if(ps != null) {
					ps.close();}
				if(rs != null) {
					rs.close();}
			} catch (SQLException e) {
			}
		}
		return list;
	}
	public int insertData(bookBean bean) {
		int cnt=-1;
		getcon();
		String sql = "insert into book values(b_num.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, bean.getTitle());
			ps.setString(2, bean.getAuthor());
			ps.setString(3, bean.getPublisher());
			ps.setInt(4, bean.getPrice());
			ps.setString(5, bean.getBuy());
			ps.setString(6, bean.getKind());
			ps.setString(7, bean.getBookstore());
			ps.setString(8, bean.getCount());
			cnt = ps.executeUpdate();
		}catch(Exception e){

		}finally {
			try {

				if(ps != null) {
					ps.close();}
				if(rs != null) {
					rs.close();}
			} catch (SQLException e) {
			}

		}

		return cnt;
	}

	public int deleteData(int num) {
		int cnt = -1;
		getcon();
		String sql = "delete from book where num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
		}catch(Exception e) {

		}finally {
			try {
				if(ps != null) {
					ps.close();}
				if(rs != null) {
					rs.close();}
			} catch (SQLException e) {
			}
		}
		return cnt;		
	}
	public int deleteAll(String [] row) {
		int cnt = -1;
		getcon();
		String sql = "delete from book where num=?";
		for (int i = 0; i < row.length-1; i++) {
			sql += " or num=? ";
		}
		try{
			ps = con.prepareStatement(sql);
			for (int i = 1; i < row.length+1; i++) {
				ps.setInt(i, Integer.parseInt(row[i-1]));
			}
			cnt = ps.executeUpdate();
		}catch(Exception e) { 

		}finally {
			try {
				if(ps != null) {
					ps.close();}
				if(rs != null) {
					rs.close();}
			} catch (SQLException e) {
			}
		}
		return cnt;
	}
	public bookBean getupdate(int num) {
		bookBean bean = null;
		getcon();
		String sql = "select * from book where num =?";
		try{ps=con.prepareStatement(sql);
		ps.setInt(1, num);
		rs = ps.executeQuery();
		if(rs.next()) {
			int num2 = rs.getInt("num");
			String title = rs.getString("title");
			String author =rs.getString("author");
			String publisher = rs.getString("publisher");
			int price = rs.getInt("price");
			String buy = rs.getString("buy");
			String kind = rs.getString("kind");
			String bookstore = rs.getString("bookstore");
			String count = rs.getString("count");			
			bean = new bookBean(num2, title, author, publisher, price, buy, kind, bookstore, count);
			
		}
		}catch(Exception e) {
			
		}finally {
			try {
				if(con != null) {
					con.close();}
				if(ps != null) {
					ps.close();}
				if(rs != null) {
					rs.close();}
			} catch (SQLException e) {
			}
	
		}
		
		return bean;
	}
	public int update(bookBean bean) {
		int cnt =-1;
		getcon();
		String sql = "update set title=?, author=?, publisher=?, price=?, buy=?, kind=?, bookstore=?, count=? where num=?";
		try{ps = con.prepareStatement(sql);
		ps.setString(1,bean.getTitle() );
		ps.setString(2,bean.getAuthor() );
		ps.setString(3, bean.getPublisher());
		ps.setInt(4, bean.getPrice());
		ps.setString(5, bean.getBuy());
		ps.setString(6, bean.getKind());
		ps.setString(7, bean.getBookstore());
		ps.setString(8, bean.getCount());
		ps.setInt(9, bean.getNum());
		
		
		cnt = ps.executeUpdate();
		}
		catch(Exception e) {
			
		}finally {
			try {
				if(con != null) {
					con.close();}
				if(ps != null) {
					ps.close();}
			} catch (SQLException e) {
			}
	
		}
		return cnt;
		
	}
}
