package my.member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class memberDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection con =null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	private static memberDao dao;
	public static memberDao getInstance() {
		if (dao ==null) {
			dao = new memberDao();
		}
		return dao;
	}
	private memberDao() {
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

	public boolean serchId(String userid) {
		boolean flag = false;
		getconn();
		String sql = "select id from members where id=?";
		try {
		psmt = con.prepareStatement(sql);
		psmt.setString(1, userid);
		rs = psmt.executeQuery();
		while (rs.next()) {
			flag=true;
		}//찾았을때 true
		}catch(Exception e) {
			
		}finally {
				try {
					if(psmt!=null)
					psmt.close();
					if(con!=null)
						con.close();
					if(rs!=null)
						rs.close();
				} catch (SQLException e) {
				}
		}
		return flag;
	}
	
	
}
