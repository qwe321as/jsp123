package book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class bookdao {
String driver ="oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "jspid";
String userpw = "jsppw";

PreparedStatement ps = null;
ResultSet rs =null;
Connection con = null;
private static bookdao dao;
public static bookdao getInstance() {
	if (dao==null) {
		dao=new bookdao();
	}
	return dao;
}
private bookdao() {
	System.out.println("boardDao()");
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
	}
}
public void getConn() {
	try {
		con = DriverManager.getConnection(url, user, userpw);
	} catch (SQLException e) {
	}
}
}
