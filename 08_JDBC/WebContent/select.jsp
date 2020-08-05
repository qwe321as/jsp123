<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

select.jsp
<hr>
<h2>register 테이블의 레코드를 화면에 표시하는 예제</h2>
<table border="1" style="width: 500px; text-align: center">
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이름</th>
		<th>성별</th>
		<th>e-mail</th>
	</tr>
	<%
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "jspid";
		String userpw = "jsppw";
		Class.forName(driver);
		con = DriverManager.getConnection(url,userid,userpw);
		String sql="select * from register";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while (rs.next()){
			String id=rs.getString("id");
			String passwd=rs.getString("passwd");
			String name=rs.getString("name");
			String gender=rs.getString("gender");
			String uname=rs.getString("uname");
			String dname=rs.getString("dname");
			
	%>
	<tr>
		<td><%=id %></td>
		<td><%=passwd %></td>
		<td><%=name %></td>
		<td><%=gender %></td>
		<td><%=uname %>@<%=dname %></td>

	</tr>
	<%	} 
		}catch(Exception e){
			
		}finally{
			if(rs != null){
				try{rs.close();
			}catch(Exception e){
				
			}
				}
			if(ps != null){
				try{rs.close();
			}catch(Exception e){
				
			}
				}
			if(con != null){
				try{rs.close();
			}catch(Exception e){
				
			}
				}
			
			
		}
	
	
	%>
</table>

