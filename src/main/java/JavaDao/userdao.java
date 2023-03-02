package JavaDao;



import bean.user;

import java.sql.ResultSet;
import java.sql.SQLException;

public class userdao extends BaseDao{
    public user selectuser(String uname, String upassword) throws SQLException {
       user u=null;
        String sql = "SELECT *FROM `user` WHERE uname=? AND upassword=?";
        ResultSet rs = executeQuery(sql,uname,upassword);
        if (rs.next()){
            u=new user();
            u.setUid(rs.getInt("uid"));
            u.setUname(rs.getString("uname"));
            u.setUpassword(rs.getString("upassword"));
            u.setUtypeid(rs.getInt("utypeid"));

        }
        return u;
    }

    public int register(String uname,String up){
           String sql ="INSERT INTO `user` VALUE(null,?,?,3)";
        return executeSQL(sql,uname,up);
    }

    public int selectutypeid(String uname) throws SQLException {
        String sql="select utypeid form user where uname=?";
        ResultSet rs = executeQuery(sql,uname);
       return rs.getInt("utypeids");
    }

    public static void main(String[] args) throws SQLException {
        user u=new userdao().selectuser("1","1");
        System.out.println(u);
    }

}
