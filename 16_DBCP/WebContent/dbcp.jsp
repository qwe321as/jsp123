<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style type="text/css">
    body{
    text-align: center
    }
    </style>
dbcp.jsp
<%
   request.setCharacterEncoding("UTF-8");
   Connection con= null;
   ResultSet rs = null;
   PreparedStatement ps =null;
   Context initContext = new InitialContext();
   Context envContext = (Context)initContext.lookup("java:/comp/env");
   DataSource  ds = (DataSource)envContext.lookup("jdbc/OracleDB");
   con = ds.getConnection();
   if(request.getParameter("username") !=null){
      String sql = "insert into tdbcp values(?,?)";
      ps = con.prepareStatement(sql);
      ps.setString(1, request.getParameter("username"));
      ps.setString(2, request.getParameter("email"));
      ps.executeUpdate();
   }
%>
<h2>DBCP.jsp</h2>
<form name="myform" method="post" action="dbcp.jsp" >
이름:<input type="text" name="username"><br>
email:<input type="text" name="email"><br>
<input type="submit" value="등록">
   </form>
   <br><hr><br>
   목록보기<br>
   <%
   String sql = "select username, email from tdbcp";
   ps= con.prepareStatement(sql);
   rs = ps.executeQuery();
   
   int i =1;
   while(rs.next()){
      out.println(i+ ":" +rs.getString("username")+","+rs.getString("email")+"<br>");
      i++;
   }
   rs.close();
   ps.close();
   con.close();
   
   %>
   