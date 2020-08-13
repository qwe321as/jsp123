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

	public int insetData(memberDTO bean) {
		int cnt = -1;
		getconn();
		String sql = "insert into members values(memseq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			psmt =con.prepareStatement(sql);
			psmt.setString(1, bean.getName());
			psmt.setString(2, bean.getId());
			psmt.setString(3, bean.getPassword());
			psmt.setString(4, bean.getRrn1());
			psmt.setString(5, bean.getRrn2());
			psmt.setString(6, bean.getEmail());
			psmt.setString(7, bean.getHp1());
			psmt.setString(8, bean.getHp2());
			psmt.setString(9, bean.getHp3());
			psmt.setString(10, bean.getJoindate());
			cnt = psmt.executeUpdate();
		}catch(Exception e) {

		}finally {
			try {
				if(psmt!=null)
					psmt.close();
				if(con!=null)
					con.close();

			} catch (SQLException e) {
			}
		}
		return cnt;
	}


	public memberDTO getMemberByrrn(String name1,String rrn11,String rrn21) {
		memberDTO mdto =null;
		getconn();
		String sql = "select * from members where name=? and rrn1=? and rrn2=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name1);
			psmt.setString(2, rrn11);
			psmt.setString(3, rrn21);
			rs = psmt.executeQuery();
			if (rs.next()) {

				mdto =getMemberBean(rs);

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
			}
		}
		return mdto;
	}

	public memberDTO getMemberfindpw(String name,String rrn1,String rrn2,String id) {
		getconn();
		memberDTO mdto = null;
		String sql = "select * from members where name=? and rrn1=? and rrn2=? and id=?";
		try{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, rrn1);
			psmt.setString(3, rrn2);
			psmt.setString(4, id);
			rs = psmt.executeQuery();
		if(rs.next()) {
			mdto=getMemberBean(rs);
		}}catch(Exception e) {

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

		return mdto;

	}
	

public memberDTO getMemberInfo(String id,String password) {
	memberDTO mdto =null;
	getconn();
	String sql = "select * from members where id =? and password =?";
	try {
		psmt=con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, password);
		rs = psmt.executeQuery();
		if(rs.next()) {
			mdto = getMemberBean(rs);
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
		}

	}
	
	return mdto;
}	
	
	
	
	
	private memberDTO getMemberBean(ResultSet rs){

		memberDTO mdto = null;
		try {
			int no = rs.getInt(1);
			String name =rs.getString(2);
			String id =rs.getString("id");
			String password =rs.getString("password");
			String rrn1 =rs.getString("rrn1");
			String rrn2 =rs.getString("rrn2");
			String email =rs.getString("email");
			String hp1 =rs.getString("hp1");
			String hp2 =rs.getString("hp2");
			String hp3 =rs.getString("hp3");
			String joindate =rs.getString("joindate");	
			mdto = new memberDTO(no, name, id, password, rrn1, rrn2, email, hp1, hp2, hp3, joindate);
		} catch (SQLException e) {

		}
		return mdto;

		/*		mdto= new MemberDTO();
    	mdto.setNo(rs.getInt("no"));
    	mdto.setId(rs.getString("id"));
    	mdto.setPassword(rs.getString("password"));
    	mdto.setRrn1(rs.getString("rrn1"));
    	mdto.setRrn2(rs.getString("rrn2"));
        mdto.setEmail(rs.getString("email"));
        mdto.setHp1(rs.getString("hp1"));
        mdto.setHp2(rs.getString("hp2"));
        mdto.setHp3(rs.getString("hp3"));
        mdto.setJoindate(rs.getString("joindate")); */
	}
}
