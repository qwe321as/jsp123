<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String uname = request.getParameter("uname");
	String dname = request.getParameter("dname");
	String sid = (String)session.getAttribute("sid");
	System.out.println(sid);
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "jspid";
		String userpw = "jsppw";
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, userpw);
		String sql = "update register set passwd =? , gender =? , uname=? , dname=? where id = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, passwd);
		ps.setString(2, gender);
		ps.setString(3, uname);
		ps.setString(4, dname);
		ps.setString(5, sid);
		ps.executeUpdate();
		
		response.sendRedirect("select.jsp");

	} catch (Exception e) {
		out.println("실패");
	} finally {
		if (con != null) {
			try {
			} catch (Exception e) {
				
			}
		}
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception e) {
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}
		}
	}
%>