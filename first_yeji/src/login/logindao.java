package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class logindao {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String userpw = "jsppw";

	PreparedStatement ps = null;
	ResultSet rs =null;
	Connection con = null;
	private static logindao dao;
	public static logindao getInstance() {
		if (dao==null) {
			dao=new logindao();
		}
		return dao;
	}
	private logindao() {
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
