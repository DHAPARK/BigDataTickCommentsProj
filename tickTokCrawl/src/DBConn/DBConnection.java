package DBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public Connection conn () {

		Connection conn = null ;
		
		try {
		
			conn = DriverManager.getConnection( Config.dbURL , Config.dbID , Config.dbPW ) ;
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		
		}
		
		return conn ;
		
	}
	
}
