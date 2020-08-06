package emart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmartDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String passwd = "jsppw";
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;
	public EmartDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		}
	}
	public void getcon() {
		try {
			con = DriverManager.getConnection(url, user, passwd);
		} catch (SQLException e) {
			System.out.println("커넥션 생성 실패");
		}
	}


	public ArrayList<EmartBean> getAllemart(){
		getcon();
		String sql = "select * from emart order by num asc";
		ArrayList<EmartBean> list = new ArrayList<EmartBean>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String product = rs.getString("product");
				String time = rs.getString("time");
				String approve = rs.getString("approve");
				String agree = rs.getString("agree");
				EmartBean bean = new EmartBean(num, id, pw, product,time,approve,agree );
				list.add(bean);
			}}catch(Exception e) {

			}finally {
				try {
					if(ps != null)
						ps.close();
				}catch(Exception e) {
				}
				try {
					if(rs != null)
						rs.close();
				}catch(Exception e) {
				}
				try {
					if(con != null)
						con.close();
				}catch(Exception e) {
				}
			}
		System.out.println("arraylist : "+ list.size());
		return list;
	}
	public int insertData(EmartBean bean) {
		System.out.println(bean.getId());
		System.out.println(bean.getPw());
		System.out.println(bean.getProduct());
		System.out.println(bean.getTime());
		System.out.println(bean.getAgree());
		System.out.println(bean.getApprove());
		getcon();
		int cnt =-1;
		String sql = "insert into emart values(e_num.nextval,?,?,?,?,?,?)";
		try{
			ps = con.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPw());
			ps.setString(3, bean.getProduct());
			ps.setString(4, bean.getTime());
			ps.setString(5, bean.getApprove());
			ps.setString(6, bean.getAgree());
			cnt=ps.executeUpdate();
		}catch(Exception e) {

		}finally {
			try {
				if(ps != null)
					ps.close();
			}catch(Exception e) {
			}
			try {
				if(rs != null)
					rs.close();
			}catch(Exception e) {
			}
			try {
				if(con != null)
					con.close();
			}catch(Exception e) {
			}
		}
		System.out.println("cnt "+cnt);
		return cnt;
	}
	public int deleteData(int num) {
		int cnt = -1;
		getcon();
		String sql = "delete from emart where num=?";
		try {
			ps =con.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
		}finally {
			try {
				if (con != null) {
					con.close();
				}
			}catch(Exception e) {

			}
			try {
				if (ps != null) {
					ps.close();
				}
			}catch(Exception e) {

			}

		}
		return cnt;	
	}
	public EmartBean getEmartbyMid(int num) {
		getcon();
		String sql = "select * from emart where num =? ";
		EmartBean bean = null;
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();

			if (rs.next()) {
				int num2 = rs.getInt("num");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String product = rs.getString("product");
				String time = rs.getString("time");
				String approve = rs.getString("approve");
				String agree = rs.getString("agree");

				bean = new EmartBean();
				
				bean.setNum(num2);
				bean.setId(id);
				bean.setPw(pw);
				bean.setProduct(product);
				bean.setTime(time);
				bean.setApprove(approve);
				bean.setAgree(agree);

			}
		}catch(Exception e) {

		}finally {
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
		return bean;
	}
	public int updateData(EmartBean bean) {
		int cnt=-1;
		getcon();
		String sql = "update emart set id=?, pw =?, product=? , time=?, approve=?,agree=? where num=?";
		try{
			ps = con.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPw());
			ps.setString(3, bean.getProduct());
			ps.setString(4, bean.getTime());
			ps.setString(5, bean.getApprove());
			ps.setString(6, bean.getAgree());
			ps.setInt(7, bean.getNum());
			cnt = ps.executeUpdate();
		}catch(Exception e) {
			}finally {
				try {
					if(ps != null)
						ps.close();
				} catch (SQLException e) {
				}
				try {
					if(con != null)
						con.close();
				} catch (SQLException e) {
				}

			}
		return cnt;
	}
	public int deletecheckData(String [] row) {
		getcon();
		int cnt =-1;
		String sql = "delete from emart where num=?";
		for(int i=0; i<row.length; i++) {
			System.out.println(row[i]+" ");
		}
		for (int i = 0; i < row.length-1; i++) {
			sql += " or num =?";
		}
		try {
			ps = con.prepareStatement(sql);
			for (int i = 1; i <= row.length; i++) {
				ps.setInt(i, Integer.parseInt(row[i-1]));
			}
		cnt = ps.executeUpdate();
		
		}catch(Exception e) {

		}finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if(con != null)
					con.close();
			} catch (SQLException e) {
			}

		}
		return cnt;
	}
}
