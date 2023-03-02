package JavaDao;

import bean.Goods;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JavaDaoLogo extends BaseDao{

    public List<Goods> DaYin(){
        List<Goods> list=new ArrayList<>();
        Goods g=null;
        String sql="SELECT * FROM goods";
        ResultSet rs = executeQuery(sql);
        try {
            while (rs.next()){
                g=new Goods();
                g.setGid(rs.getLong("gid"));
                g.setGname(rs.getString("gname"));
                g.setGtypeid(rs.getLong("gtypeid"));
                g.setPrice(rs.getDouble("price"));
                g.setStock(rs.getLong("stock"));
                g.setDescribe(rs.getString("describe"));
                g.setSid(rs.getLong("sid"));
                g.setSuid(rs.getLong("suid"));
                g.setPaddr(rs.getString("paddr"));
                list.add(g);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    //查id方法ShopId
    public Goods ShopId(Goods g){
        Goods goods=null;
        String sql="SELECT * FROM goods WHERE gid=?";
        ResultSet rs = executeQuery(sql,g.getGid());
//        System.out.println(g.getGid());
        try {
            if (rs.next()){
                goods=new Goods();
                goods.setGid(rs.getLong("gid"));
                goods.setGname(rs.getString("gname"));
                goods.setGtypeid(rs.getLong("gtypeid"));
                goods.setPrice(rs.getDouble("price"));
                goods.setStock(rs.getLong("stock"));
                goods.setDescribe(rs.getString("describe"));
                goods.setSid(rs.getLong("sid"));
                goods.setSuid(rs.getLong("suid"));
                goods.setPaddr(rs.getString("paddr"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goods;
    }

    //查id方法ShopId
    public Goods ShopId2(long gid){
        Goods goods=null;
        String sql="SELECT * FROM goods WHERE gid=?";
        ResultSet rs = executeQuery(sql,gid);
//        System.out.println(g.getGid());
        try {
            if (rs.next()){
                goods=new Goods();
                goods.setGid(rs.getLong("gid"));
                goods.setGname(rs.getString("gname"));
                goods.setGtypeid(rs.getLong("gtypeid"));
                goods.setPrice(rs.getDouble("price"));
                goods.setStock(rs.getLong("stock"));
                goods.setDescribe(rs.getString("describe"));
                goods.setSid(rs.getLong("sid"));
                goods.setSuid(rs.getLong("suid"));
                goods.setPaddr(rs.getString("paddr"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goods;
    }

    public boolean ADD(String gname, long gtypeid, double price, long stock, String describe, long sid, long suid, String paddr){
        int num=0;
//        String sql="insert into goods VALUES(null,'"+gname+"','"+gtypeid+"','"+price+"','"+stock+"','"+describe+"','"+sid+"','"+suid+"','"+paddr+"')";
        String sql="insert into goods VALUES(null,'"+gname+"','"+3+"','"+price+"','"+stock+"','"+describe+"','"+1+"','"+2+"','"+paddr+"')";
        num=executeSQL(sql);
        return num>0;
    }
    public boolean Del(long id){
        int num=0;
        String sql="delete FROM goods WHERE gid = ?";
        num =executeSQL(sql, id);
        return num>0;
    }


    public static void main(String[] args) {
        int a=5;
        Goods goods=new Goods();
        goods.setGid(a);
        Goods g = new JavaDaoLogo().ShopId(goods);
        System.out.println(g);
//        System.out.println(new JavaDaoLogo().ADD("1", "1"));
    }

}
