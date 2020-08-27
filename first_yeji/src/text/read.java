package text;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class read {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String userpw = "jsppw";

	PreparedStatement ps = null;
	ResultSet rs =null;
	Connection con = null;
	private static read dao;
	public static read getInstance() {
		if (dao==null) {
			dao=new read();
		}
		return dao;
	}
	private read() {
		System.out.println("readDao()");
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
	public ArrayList<String[]> gettext(int bnum1){
		BufferedReader bReader = null;
		 ArrayList<String[]> list =null;
		 getConn();
		String sql = "select * from book where bnum=?";
		try {	
			ps = con.prepareStatement(sql);
			ps.setInt(1, bnum1);
			rs = ps.executeQuery();
			if (rs.next()) {
				String title =rs.getString("title");
				list = new ArrayList<String[]>();  
				int cnt=0;
				String s;
				String b;
				File file = new File("C:\\JSP_yeji\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\first_yeji\\admin\\book\\"+title+".txt");
				bReader = new BufferedReader(new FileReader(file));
				while((s = bReader.readLine()) != null) {
					cnt++;
				}
				System.out.println(cnt);
				int count=cnt/15+1;
				System.out.println(count);
				String [][] A = new String [count][15];
				bReader = new BufferedReader(new FileReader(file));
				while((b = bReader.readLine()) != null) {
					for (int j = 0; j <count; j++) {
						for (int i = 0; i < 15; i++) {
							A[j][i]=bReader.readLine();
							//System.out.println(A[j][i]);
						}
					}
					
				}
				int coo=0;
				 list = new ArrayList<String[]>();  
				for(int i=0; i<A.length; i++) {                         //ют╥б
	  list.add(new String[]{A[i][0], A[i][1], A[i][3],A[i][4], A[i][5], A[i][6],A[i][7], A[i][8], A[i][9],A[i][10], A[i][11], A[i][12],A[i][13],A[i][14]});}
				for(int i=0; i<list.size(); i++)
				{ 
				for (int j = 0; j <13; j++) {
				//System.out.println(list.get(i)[j]+coo);
				coo++;
				}
				}
			}
		}catch(Exception e) {

		}finally {
			try {	
			if(con != null) {
			con.close();}
			if(bReader != null) bReader.close();
			if(ps != null) {
				ps.close();}
			if(rs != null) {
				rs.close();}
			} catch(Exception e) {
			}
		}
		return list;

	}
}




