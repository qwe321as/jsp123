package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class boardDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid" ; 
	String password="jsppw" ;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static boardDao dao;

	public static boardDao getInstance() {
		if(dao == null) {
			dao = new boardDao();
		}
		return dao;
	}

	private boardDao() {
		System.out.println("boardDao()");

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	} // 생성자

	public void getConnection(){  
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}   
	}//getConnection

	public int getArticleCount(){

		getConnection();

		String sql = "select count(*) as cnt from board"; // 100

		int x = 0;

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				x = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}catch(Exception e) {

			}
		}

		return x;

	}//getArticleCount()

	public ArrayList<boardBean> getArticles(int start, int end){ 

		getConnection();
		ArrayList<boardBean> lists = new ArrayList<boardBean>();

		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";	

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);

			rs = ps.executeQuery();
			while(rs.next()) {
				boardBean bean= new boardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setContent(rs.getString("content"));
				bean.setIp(rs.getString("ip")); 

				lists.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}catch(Exception e) {

			}
		}

		return lists;

	}//getArticles

	public int insertArticle(boardBean article){ // 원글쓰기 
		getConnection();
		int cnt = -1;
		String sql = "insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) " + 
				"values(board_seq.nextval,?,?,?,?,?,board_seq.currval,?,?,?,?)";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, article.getWriter());
			ps.setString(2, article.getEmail());
			ps.setString(3, article.getSubject());
			ps.setString(4, article.getPasswd());
			ps.setTimestamp(5, article.getReg_date());
			ps.setInt(6, 0); // re_step
			ps.setInt(7, 0); // re_level
			ps.setString(8, article.getContent());
			ps.setString(9, article.getIp());
			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}catch(Exception e) {

			}
		}
		return cnt;

	}//insertArticle

	public boardBean select(int num1) {
		boardBean bean = null;
		getConnection();
		String sql ="select * from board where num=?";
		String sql_update ="update board set readcount = readcount+1 where num=?";
		try {
			ps = con.prepareStatement(sql_update);
			ps.setInt(1, num1);
			ps.executeUpdate();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num1);
			rs = ps.executeQuery();
			if(rs.next()) {
				int num = rs.getInt("num");
				String	writer = rs.getString("writer");
				String	email = rs.getString("email");
				String	subject = rs.getString("subject");
				String	passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref=rs.getInt("ref");
				int re_step=rs.getInt("re_step");
				int re_level=rs.getInt("re_level");
				String	content = rs.getString("content");
				String	ip = rs.getString("ip"); 
				bean = new boardBean(num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip);
			}
		}catch(SQLException e) {

		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}catch(Exception e) {

			}
		}

		return bean;
	}
	public int deleteArticle(int num, String passwd) {
	int cnt=-1;
	getConnection();
//	String sql1 = "select passwd from board where num=?";
//	String sql = "delete from board where num=?";
	String sql = "delete from board where num=? and passwd =?";
	try {
//	ps = con.prepareStatement(sql1);
//	ps.setInt(1, num);
//	rs =ps.executeQuery();
//	if (rs.next()) {
//		String dbpasswd = rs.getString("passwd");
//		if (dbpasswd.equals(passwd)) {
	//		ps = con.prepareStatement(sql);
		//	ps.setInt(1, num);
			//cnt = ps.executeUpdate();
			
		//}
	//}
		
		
		ps= con.prepareStatement(sql);
		ps.setInt(1, num);
		ps.setString(2, passwd);
		cnt=ps.executeUpdate();
	}catch(Exception e) {
		
	}
	finally {
		try {
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		}catch(Exception e) {

		}
	}
	return cnt;
	}
public int replyArticle(boardBean bean) {
	getConnection();
	int cnt = -1;
	String sql = "insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) " + 
			"values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
	String sql_update = "update board set re_step = re_step+1 where ref=? and re_step>?";
	try {
		ps = con.prepareStatement(sql_update);
		ps.setInt(1, bean.getRef());
		ps.setInt(2, bean.getRe_step()); //이미있는것들에 +1 하는 작업
		ps.executeUpdate();
		
		ps = con.prepareStatement(sql);
		ps.setString(1, bean.getWriter());
		ps.setString(2, bean.getEmail());
		ps.setString(3, bean.getSubject());
		ps.setString(4, bean.getPasswd());
		ps.setTimestamp(5, bean.getReg_date());
		ps.setInt(6, bean.getRef()); // re_step
		ps.setInt(7, bean.getRe_step()+1); // re_step
		ps.setInt(8, bean.getRe_level()+1); // re_level
		ps.setString(9, bean.getContent());
		ps.setString(10, bean.getIp());
		cnt = ps.executeUpdate();
		
		
	}catch(Exception e) {
		
	}finally {
		try {
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
			if(con!=null)
				con.close();
		}catch(Exception e) {

		}
		
	}
return cnt;	
}

}





