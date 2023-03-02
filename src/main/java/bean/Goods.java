package bean;


public class Goods {

  private long gid;//商品id
  private String gname;//商品名字
  private long gtypeid;//项目类型id
  private double price;//商品价格
  private long stock;//商品库存
  private String describe;//商品描述
  private long sid;//店铺id
  private long suid;//商家id
  private String paddr;//图片地址

  @Override
  public String toString() {
    return "Goods{" +
            "gid=" + gid +
            ", gname='" + gname + '\'' +
            ", gtypeid=" + gtypeid +
            ", price=" + price +
            ", stock=" + stock +
            ", describe='" + describe + '\'' +
            ", sid=" + sid +
            ", suid=" + suid +
            ", paddr='" + paddr + '\'' +
            '}';
  }

  public Goods() {
  }

  public Goods(long gid, String gname, long gtypeid, double price, long stock, String describe, long sid, long suid, String paddr) {
    this.gid = gid;
    this.gname = gname;
    this.gtypeid = gtypeid;
    this.price = price;
    this.stock = stock;
    this.describe = describe;
    this.sid = sid;
    this.suid = suid;
    this.paddr = paddr;
  }

  public long getGid() {
    return gid;
  }

  public void setGid(long gid) {
    this.gid = gid;
  }


  public String getGname() {
    return gname;
  }

  public void setGname(String gname) {
    this.gname = gname;
  }


  public long getGtypeid() {
    return gtypeid;
  }

  public void setGtypeid(long gtypeid) {
    this.gtypeid = gtypeid;
  }


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public long getStock() {
    return stock;
  }

  public void setStock(long stock) {
    this.stock = stock;
  }


  public String getDescribe() {
    return describe;
  }

  public void setDescribe(String describe) {
    this.describe = describe;
  }


  public long getSid() {
    return sid;
  }

  public void setSid(long sid) {
    this.sid = sid;
  }


  public long getSuid() {
    return suid;
  }

  public void setSuid(long suid) {
    this.suid = suid;
  }


  public String getPaddr() {
    return paddr;
  }

  public void setPaddr(String paddr) {
    this.paddr = paddr;
  }

}
