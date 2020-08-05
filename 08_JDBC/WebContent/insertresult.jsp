<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement ps = null;
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String uname = request.getParameter("uname");
	String dname = request.getParameter("dname");
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "jspid";
		String userpw = "jsppw";
		Class.forName(driver);
		con = DriverManager.getConnection(url, userid, userpw);
		String sql = "insert into register values(?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, passwd);
		ps.setString(3, name);
		ps.setString(4, gender);
		ps.setString(5, uname);
		ps.setString(6, dname);
		int cnt = ps.executeUpdate();
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
				con.close();
			} catch (Exception e) {
			}
		}
	}
%>
<%=id%>
<%=passwd%>
<%=name%>
<%=gender%>
<%=uname%>
<%=dname%>

<!-- <meta http-equiv="refresh" content="2; url=select.jsp"> -->
<!-- select.jsp를 2초뒤에 켜라 -->
<%-- <jsp:forward page="select.jsp" /> --%>
<!-- 바로가는 액션태그 -->
<%
	response.sendRedirect("select.jsp");
%>
<!-- 바로넘어감 -->
<!-- 공통점 : 중간에 거쳐가는 페이지이다.
차이점 
forward: url이 중간에 거쳐가는 페이지 주소를 출력한다. 객체를 공유한다.
response: url이 마지막 페이지 주소를 출력한다. 공유하지않는다. -->