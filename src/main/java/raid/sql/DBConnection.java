package raid.sql;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	public static Connection getConnection() throws SQLException, NamingException, ClassNotFoundException
	{
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/raid");
		Connection conn = ds.getConnection();
		return conn;
		
	}
}