package empl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class emplDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String pw = "jsppw";
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;
	public emplDao() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
		}catch(Exception e){
		}
	}
	public void getCon() {
		try {
			con=DriverManager.getConnection(url,user,pw);
			System.out.println("커넥션 객체 생성 성공");

		}catch(Exception e){

		}
	}

	/* ArrayList and vector  둘다 사용가능*/
	public ArrayList <emplBean> getAllempl(){
		getCon();
		System.out.println("getAllempl()");

		String sql = "select * from empl order by mid asc";
		ArrayList<emplBean> list = new ArrayList<emplBean>();
		try {
			ps = con.prepareStatement(sql);			
			rs = ps.executeQuery();
			while(rs.next()) {
				int mid = rs.getInt("mid");
				String name= rs.getString("name");
				int did=rs.getInt("did");
				int salary = rs.getInt("salary");
				emplBean eb = new emplBean();
				eb.setMid(mid);
				eb.setName(name);
				eb.setDid(did);
				eb.setSalary(salary);
				/* emplBean eb = new emplBean(mid, name, did, salary); */
				list.add(eb);
			}
		}catch(Exception e) {

		}finally {
			if(rs!=null) {
				try{rs.close();
				}catch(Exception e) {

				}
			}
			try{
				if(con!=null) {
					con.close();}	
			}catch(Exception e) {
			}

			try{
				if(ps!=null) {
					ps.close();}
			}catch(Exception e) {

			}
		}
		System.out.println("getAll lists.size()" + list.size());

		return list;
	}
	public int insertData(emplBean bean) {
		getCon();
		String sql = "insert into empl (mid,name,did,salary) values(e_seq.nextval,?,?,?)";
		int cnt=-1;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setInt(2, bean.getDid());
			ps.setInt(3, bean.getSalary());
			cnt=ps.executeUpdate();
		}catch(Exception e) {

		}finally {
			try{
				if(rs!=null) {
					rs.close(); }}
			catch(Exception e) {

			}

			try{
				if(con!=null) {
					con.close();}	
			}catch(Exception e) {
			}

			try{
				if(ps!=null) {
					ps.close();}
			}catch(Exception e) {

			}
		}
		return cnt;
	}

	public int deleteData(int mid) {
		int cnt=-1;
		getCon();
		String sql = "delete from empl where mid=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, mid);
			cnt = ps.executeUpdate();
		}catch(Exception e) {

		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
			}catch(Exception e) {

			}
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

	public emplBean getEmlebyMid(int mid){

		getCon();

		String sql = "select name, salary, did from empl where mid=?";

		emplBean bean=null;

		try{
			ps=con.prepareStatement(sql);
			ps.setInt(1,mid);
			rs = ps.executeQuery();

			if(rs.next()){
				String name = rs.getString("name");
				int salary = rs.getInt("salary");
				int did = rs.getInt("did");

				bean = new emplBean(mid,name,did,salary);
			}
		} catch (Exception e){
			e.printStackTrace();

		}finally{
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
	public int updateData(emplBean bean) {
		int cnt =-1;
		getCon();
		String sql = "update empl set name=?, did=?, salary=? where mid=?";		
		try{
		ps = con.prepareStatement(sql);
		ps.setString(1, bean.getName());
		ps.setInt(2, bean.getDid());
		ps.setInt(3, bean.getSalary());
		ps.setInt(4, bean.getMid());
		cnt = ps.executeUpdate();
		}catch(Exception e) {}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
			}catch(Exception e) {

			}
			try {
				if(ps!=null) {
					ps.close();
				}
			}catch(Exception e) {

			}
			try {
				if(con!=null) {
					con.close();
				}
			}catch(Exception e) {

			}

		}

		return cnt;

	}
	
	public int deletecheckData(String [] rowcheck) {
		getCon();
		int cnt=-1;
		String sql = "delete from empl where mid=?";
		for(int i=0; i<rowcheck.length; i++) {
			System.out.println(rowcheck[i]+" ");
		}
		for (int i = 0; i < rowcheck.length-1; i++) {
			sql += " or mid =?";
		}
		/* 위에서 하나 실행해서 -1이 있음*/
		try {
		ps = con.prepareStatement(sql);
		for (int i = 1; i <= rowcheck.length; i++) {
			ps.setInt(i, Integer.parseInt(rowcheck[i-1]));
		}
		cnt = ps.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
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
			try {
				if(ps != null)
					ps.close();
			}catch(Exception e) {
			}
		}
		return cnt;
	}
}



