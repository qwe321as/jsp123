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
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "jspid";
		String userpw = "jsppw";
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, userpw);
		String sql = "select id, passwd from register where id=?";
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		if (rs.next()) {
			String dbpw = rs.getString("passwd");
			if (passwd.equals(dbpw)) {
				sql = "delete from register where id=? ";
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ps.executeUpdate();
%><jsp:forward page="select.jsp"></jsp:forward><%
	} else {
				out.println("패스워드가 다릅니다.");
%><meta http-equiv="refresh" content="2; url=delete.jsp"><%
	}
		} else {
			out.println("아이디가 다릅니다.");
%><meta http-equiv="refresh" content="2; url=delete.jsp"><%
	}
	} catch (Exception e) {
		out.println("실패");
	} finally {
		if (con != null) {
			try {
				con.close();
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
<%=id%>
<%=passwd%>
