package quizz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class quizzdao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection con =null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private static quizzdao dao;

	public static quizzdao getInstance() {
		if (dao ==null) {
			dao = new quizzdao();
		}
		return dao;
	}
	private quizzdao() {
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
	public 	ArrayList<quizzbean> select() {
		ArrayList<quizzbean> list  =new ArrayList<quizzbean>();
		getconn();
		String sql="select * from quizz";
		try {
			ps = con.prepareStatement(sql);
			rs =ps.executeQuery();
			while (rs.next()) {
				int qnum = rs.getInt(1);
				String book= rs.getString(2); 
				String question= rs.getString(3);
				String answer= rs.getString(4);
				quizzbean baen = new quizzbean(qnum, book, question, answer);
				list.add(baen);
			}
		} catch (Exception e) {
		}finally {
			try {
				if(con!=null)
				con.close();
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;

	}
	public int insert(String book,String question,String answer) {
		int cnt=-1;
		getconn();
		String sql="insert into quizz values(quiz_s.nextval,?,?,?)";
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, book);
			ps.setString(2, question);
			ps.setString(3, answer);
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
	public int delete(int qnum) {
		int cnt=-1;
		getconn();
		String sql="delete from quizz where qnum=?";
		try {
			ps =con.prepareStatement(sql);
			ps.setInt(1, qnum);
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


}
