<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	ResultSet rs= null;
	Connection conn = null;
	PreparedStatement pstmt = null;
try{
		
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "jspid";
	String userpw = "jsppw";
	Class.forName(driver);
	conn= DriverManager.getConnection(url,userid,userpw);
	String sql ="select id, passwd from member where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		String dbid= rs.getString("id");
		String dbpw = rs.getString("passwd");
		if(id.equals(dbid) && passwd.equals(dbpw)){
			sql = "update member set name=? where id=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, passwd);
			pstmt.executeUpdate();
			out.println("<hR> 성공");
		}else{
		out.println("패스워드가 다릅니다.");
			} }
		else{
		out.println("아이디가 다릅니다.");
		}
	} catch (Exception e) {
		out.println("오류발생");
	} finally {
		if(rs != null){
			try{
			rs.close();
			}catch (SQLException e){	
			}}
		if(pstmt != null){
			try{
			pstmt.close();
			}catch (SQLException e){
				
			}}
		if(conn != null){
			try{
			conn.close();
			}catch (SQLException e){	
			}
		}

	}
		
%>