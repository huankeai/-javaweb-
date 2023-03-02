package JavaDao;

import java.sql.*;

public class JDBCUtils {
	
	private static final String DRIVERNAME = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/erweishu?characterEncoding=UTF-8&useSSL=no";
	private static final String USERNAME = "root";
	private static final String USERPWD = "2002";

	// 获取数据库连接
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVERNAME);
		return DriverManager.getConnection(URL,USERNAME,USERPWD);
	}

	// 关闭释放资源
	public static void release(Statement stmt,Connection conn) {
		if(stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			stmt = null;
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn = null;
		}
	}

	// 关闭释放资源
	public static void release(ResultSet rs,Statement stmt,Connection conn) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = null;
		}
		release(stmt,conn);
	}

//	public static void main(String[] args) {
//		try {
//			System.out.println(getConnection());
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
}
