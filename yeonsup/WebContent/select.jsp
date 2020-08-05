<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table border="1" style="width: 300px; text-align: center">
	<tr>
		<th>ID</th>
		<th>이름</th>
		<th>책</th>
		<th>생일</th>
	</tr>

			<%
				request.setCharacterEncoding("UTF-8");			
				String driver = "oracle.jdbc.driver.OracleDriver";
				String url = "jdbc:oracle:thin:@localhost:1521:orcl";
				String userid = "jspid";
				String userpw = "jsppw";

				ResultSet rs = null;
				Connection con = null;
				PreparedStatement ps = null;
				try {
					Class.forName(driver);
					con = DriverManager.getConnection(url, userid, userpw);
					String sql = "select * from yeon";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();
					while (rs.next()) {
						String id = rs.getString("id");
						String name = rs.getString("name");
						String book = rs.getString("book");
						String birth = String.valueOf(rs.getDate("birth"));
			%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=book %></td>
		<td><%=birth %></td>
	</tr>
	<%
		}
		} catch (Exception e) {
			out.println("오류");

		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {

				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {

				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {

				}
			}
		}
	%>
</table>