package JavaDao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BaseDao {

    protected Connection        conn  = null;
    protected PreparedStatement pstmt = null;
    protected ResultSet rs = null;

    // 执行查询
    public ResultSet executeQuery(String preparedSql,Object...param){
        
        try {
            conn = JDBCUtils.getConnection();     
            pstmt = conn.prepareStatement(preparedSql);
            if( param != null ) {
                for( int i = 0; i < param.length; i++ ) {
                    pstmt.setObject(i+1, param[i]);     
                }
            }
            rs = pstmt.executeQuery();     
        } catch (Exception e) {
        	e.printStackTrace();  
        } 
        return rs;
    }
    
	public int executeSQL(String preparedSql,Object...param) {
        int  num   = 0;
        try {
            conn = JDBCUtils.getConnection();   
            pstmt = conn.prepareStatement(preparedSql);    
            if( param != null ) {
                for( int i = 0; i < param.length; i++ ) {
                    pstmt.setObject(i+1, param[i]);   
                }
            }
            num = pstmt.executeUpdate();      
        } catch(Exception e) {
            e.printStackTrace();                
        } finally {    
        	JDBCUtils.release(pstmt, conn);         
        }
        return num;
    }
	
}
