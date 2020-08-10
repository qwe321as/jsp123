package Movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MovieDao {
	private static MovieDao movi;
	public static MovieDao getInstance() {
		if (movi == null) {
			movi = new MovieDao();
		}
		return movi;
	}
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user="jspid";
	String userpw = "jsppw";
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;
	public MovieDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.print("드라이브로딩실패");
		}
	}
	public void getcon() {
		try {
			con = DriverManager.getConnection(url, user, userpw);
		} catch (SQLException e) {
			System.out.print("접속실패");
		}

	}
	public ArrayList<MovieBean> getAll(){
		ArrayList<MovieBean> list = new ArrayList<MovieBean>();
		getcon();
		String sql = "select * from movie";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()){
				String num = rs.getString("num");
				String id=rs.getString("id");
				String name=rs.getString("name");
				int	age=rs.getInt("age");
				String genre=rs.getString("genre");
				String time=rs.getString("time");
				int partner=rs.getInt("partner");
				String memo=rs.getString("memo");
				MovieBean bean = new MovieBean(num, id, name, age, genre, time, partner, memo);
				list.add(bean);
			}
		}catch(Exception e) {
		}finally {
			try {
				if(con!=null)
					con.close();
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}
	public int insertData(MovieBean bean) {
		int cnt = -1;
		getcon();
		String sql= "insert into movie values(mv_seq.nextval, ?, ?, ?, ?, ?, ?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getName());
			ps.setInt(3, bean.getAge());
			ps.setString(4, bean.getGenre());
			ps.setString(5, bean.getTime());
			ps.setInt(6, bean.getPartner());
			ps.setString(7, bean.getMemo());
			cnt = ps.executeUpdate();
		}catch(Exception e){

		}finally {
			try {
				if(con!=null)
					con.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
			}
		}
		System.out.println(bean.getId());
		System.out.println(bean.getName());
		System.out.println(bean.getAge());
		System.out.println(bean.getGenre());
		System.out.println(bean.getTime());
		System.out.println(bean.getPartner());
		System.out.println(bean.getMemo());
		return cnt;
	}
	public int deleteData(int num) {
		int cnt = -1;
		getcon();
		String sql = "delete from movie where num=?";
		try {
			ps= con.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
		}catch(Exception e) {

		}finally {
			try {
				if(con!=null)
					con.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
			}
		}
		return cnt;
	}
	public int deleteall(String [] row) {
		int cnt= -1;
		String sql = "delete from movie where num=?";
		getcon();
		try {
			for(int i =0; i<row.length-1; i++) {
				sql +=" or num =? ";
			}
			ps = con.prepareStatement(sql);
			for (int i = 1; i < row.length+1; i++) {
				
				ps.setInt(i, Integer.parseInt(row[i-1]));
			}
			cnt = ps.executeUpdate();
		}catch(Exception e) {

		}finally {
			try {
				if(con!=null)
					con.close();
				if(ps!=null)
					ps.close();
			}catch (SQLException e) {
			}
		}
		return cnt;

	}
	
	public MovieBean getupdate(int num) {
		MovieBean bean =null;
		getcon();
		String sql = "select * from movie where num = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				String num1 = rs.getString("num");
				String id=rs.getString("id");
				String name=rs.getString("name");
				int	age=rs.getInt("age");
				String genre=rs.getString("genre");
				String time=rs.getString("time");
				int partner=rs.getInt("partner");
				String memo=rs.getString("memo");
				bean = new MovieBean(num1, id, name, age, genre, time, partner, memo);

			}
		}catch(Exception e) {
			
		}finally {
			try {
				if(con!=null)
					con.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			}catch (SQLException e) {
			}
		}
		
		
		return bean;

	}
	public int update(MovieBean bean) {
		int  cnt = -1;
		getcon();
		System.out.print(cnt);
		String sql ="update movie set id=?, name=?, age=?, genre=?, time=?, partner=?, memo=? where num =? ";
		try {
			ps= con.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getName());
			ps.setInt(3, bean.getAge());
			ps.setString(4, bean.getGenre());
			ps.setString(5, bean.getTime());
			ps.setInt(6, bean.getPartner());
			ps.setString(7, bean.getMemo());
			ps.setString(8, bean.getNum());
			cnt = ps.executeUpdate();
			System.out.print(bean.getNum());
			System.out.print(bean.getMemo());

		}catch(Exception e){
			
		}finally {
			try {
				if(con!=null)
					con.close();
				if(ps!=null)
					ps.close();
			}catch (SQLException e) {
			}
		}
		return cnt;
	}
	public boolean serchId(String id) {
		boolean flag = false;
		getcon();
		String sql = "select id from movie where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,id);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				flag = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
			
		return flag;
	}
}
