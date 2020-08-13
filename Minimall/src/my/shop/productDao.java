package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class productDao {
	String driver ="oracle.jdbc.dreiver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String userwd="jsppw";
	ResultSet rs =null;
	Connection con=null;
	PreparedStatement psmt=null;
	private static productDao dao;
}
