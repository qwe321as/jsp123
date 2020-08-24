package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.swing.border.Border;


public class boardDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid" ; 
	String userpw="jsppw" ;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	private static boardDao dao;
	public static boardDao getInstance() {
		if (dao==null) {
			dao = new boardDao();
		}
		return dao;
	}
	private boardDao() {
		System.out.println("boardDao");
		try {
			Class.forName(driver);
		} catch (Exception e) {
		}
	}
	public void getcon() {
		try {
			con = DriverManager.getConnection(url, username, userpw);
		} catch (Exception e) {
		}
	}
	public int getArticleCount() {
		int cnt =0;
		getcon();
		String sql = "select count(*) as cnt from book_board";
		try {
			ps=con.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			// TODO: handle exception
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
	public ArrayList<BoardBean> getArticles(int startRow,int endRow) {
		getcon();
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		String sql = "select num, writer, password, title,  content, reg_date, readcount, ref, re_step, re_level " ;		        
		sql += "from (select rownum as rank, num, writer, password, title, content, reg_date, readcount, ref, re_step, re_level ";
		sql += "from (select num, writer, password, title, content, reg_date, readcount, ref, re_step, re_level ";
		sql += "from book_board order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";	
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs=ps.executeQuery();
			while (rs.next()){
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setPassword(rs.getString("password"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));

				list.add(bean);				
			}
		} catch (Exception e) {
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

		return list;


	}
	public int insertArticle(BoardBean bean) {
		getcon();
		int cnt=-1;
		String sql="insert into book_board values(board_seq.nextval,?,?,?,?,?,?,board_seq.currval,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, bean.getWriter());
			ps.setString(2, bean.getPassword());
			ps.setString(3, bean.getTitle());
			ps.setString(4, bean.getContent());
			ps.setTimestamp(5, bean.getReg_date());
			ps.setInt(6, bean.getReadcount());
			ps.setInt(7, 0);
			ps.setInt(8, 0);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
		}finally {
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
	public int replyArticle(BoardBean bean) {
		getcon();
		int cnt=-1;
		String sql="insert into book_board values(board_seq.nextval,?,?,?,?,?,?,?,?,?)";
		String sql_update="update book_board set re_step = re_step+1 where ref=? and re_step>?";
		try {
			ps =con.prepareStatement(sql_update);
			ps.setInt(1, bean.getRef());
			ps.setInt(2, bean.getRe_step());
			ps.executeUpdate();
			ps = con.prepareStatement(sql);
			ps.setString(1, bean.getWriter());
			ps.setString(2, bean.getPassword());
			ps.setString(3, bean.getTitle());
			ps.setString(4, bean.getContent());
			ps.setTimestamp(5, bean.getReg_date());
			ps.setInt(6, bean.getReadcount());
			ps.setInt(7, bean.getRef());
			ps.setInt(8, bean.getRe_step()+1);
			ps.setInt(9, bean.getRe_level()+1);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
		}finally {
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
	public BoardBean select(int num1) {
		getcon();
		System.out.println(num1);
		BoardBean bean = null;
		String sql ="select * from book_board where num=?";
		String sql_update ="update book_board set readcount = readcount+1 where num=?";
		try {
			ps = con.prepareStatement(sql_update);
			ps.setInt(1, num1);
			ps.executeUpdate();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num1);
			rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1));
				int num = rs.getInt("num");
				 String writer=rs.getString("writer");
				 String password=rs.getString("password"); 
				 String title=rs.getString("title");
				 String content=rs.getString("content"); 
				 Timestamp reg_date=rs.getTimestamp("reg_date"); 
				 int  readcount=rs.getInt("readcount");
				 int ref=rs.getInt("ref");
				 int re_step=rs.getInt("re_step"); 
				 int re_level=rs.getInt("re_level"); 
				 bean = new BoardBean(num, writer, password, title, content, reg_date, readcount, ref, re_step, re_level);
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
	public BoardBean select2(int num1) {
		getcon();
		System.out.println(num1);
		BoardBean bean = null;
		String sql ="select * from book_board where num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num1);
			rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1));
				int num = rs.getInt("num");
				String writer=rs.getString("writer");
				String password=rs.getString("password"); 
				String title=rs.getString("title");
				String content=rs.getString("content"); 
				Timestamp reg_date=rs.getTimestamp("reg_date"); 
				int  readcount=rs.getInt("readcount");
				int ref=rs.getInt("ref");
				int re_step=rs.getInt("re_step"); 
				int re_level=rs.getInt("re_level"); 
				bean = new BoardBean(num, writer, password, title, content, reg_date, readcount, ref, re_step, re_level);
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
	public int delete(int num, String password) {
		int cnt=-1;
		getcon();
		String sql ="delete from book_board where num=? and password=?";
		try {
			ps =con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, password);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
	public int update(BoardBean bean) {
		int cnt=-1;
		getcon();
		String sql ="update book_board set title=?, content=? where num=? and password=?";
		try {
			ps =con.prepareStatement(sql);
			ps.setString(1, bean.getTitle());
			ps.setString(2, bean.getContent());
			ps.setInt(3, bean.getNum());
			ps.setString(4, bean.getPassword());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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

}
