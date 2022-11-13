package DBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	
	public Connection getConnection() {
		
		Connection conn = null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//final String dbURL = "jdbc:oracle:thin:@localhost:1521:xe" ;
			final String dbURL = "jdbc:oracle:thin:@dtdb_high?TNS_ADMIN=Wallet_dtdb" ;
			
			final String dbID = "ADMIN" ;
			
			final String dbPW = "Ehgusdlsp486" ;
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		} catch (ClassNotFoundException e) {

			e.printStackTrace(); System.out.println("드라이버 로딩 실패");
			
		} catch (SQLException e) {
			
			e.printStackTrace(); System.out.println("연결 실패");
			
		} catch (Exception e) {
			
			e.printStackTrace(); System.out.println("알 수 없는 오류");
			
		}
		
		return conn;
	}
}
