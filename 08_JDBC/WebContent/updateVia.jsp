<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
updateVia.jsp<br><br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter( "id");
	String passwd = request.getParameter( "passwd" );
	System.out.println(id+","+passwd);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String dbId = "jspid";
		String dbPasswd = "jsppw";
		conn = DriverManager.getConnection( url, dbId, dbPasswd );
		
		String sql = "select * from register where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			//String dbpw = rs.getString("passwd");
			if(passwd.equals(rs.getString("passwd"))){
				// 아이디와 비번 모두 일치
				session.setAttribute("sid", id);
	%>
			<form method="post" action="updateresult.jsp">
			<%-- <form method="post" action="updateresult.jsp?id=<%=rs.getString("id")%>"> --%>
			<%-- <input type="hidden" name="id" value="<%=id %>"> --%>
				<table border=1>
					<tr>
						<th colspan=2>
							수정할 정보를 입력해 주세요.
						</th>
					</tr>				
				
					<tr>
						<th>아이디</th>
						<td> <%=id %></td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td> <input type="text" name="passwd"> </td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td> <%=rs.getString("name") %> </td>
					</tr>
					
					<tr>
						<th>성별</th>
						<td> 
							<input type="radio" name="gender" value="남" checked>남
    	   					<input type="radio" name="gender" value="여">여
						 </td>
					</tr>
					
					<tr>
						<th>이메일</th>
						<td> 
							<input type="text" name="uname" value="<%=rs.getString("uname") %>">@
				  			<select name="dname">
					  			<option value="daum.net">daum.net</option>
					  			<option value="naver.com">naver.com</option>
					  			<option value="nate.com">nate.com</option>
					  			<option value="google.com">google.com</option>
					  			<option value="yahoo.com">yahoo.com</option> 		
				  			</select>
						</td>
					</tr>
					
					<tr>
						<th colspan="2">
							<input type="submit" value="수정">
							<input type="reset" value="취소">
						</th>
					</tr>
				</table>
			</form>	
				
				
	<%			
				
			} else{
				%>
					비밀번호가 다릅니다. <br>
					다시 확인해주세요 <br>
					<meta http-equiv="refresh" content="2; url=update.jsp"> 
				<%
			}
			
		} else{
			%>
				<%=id %>는 없는 아이디입니다.<br>
				다시 확인해주세요 <br>
				<meta http-equiv="refresh" content="2; url=update.jsp"> 
			<%			
		}
	}catch(SQLException e){
		
	}finally{
		
	}
%>


