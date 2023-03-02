package bean;

public class gtype {
    int gtypeid;
    String gtypename;

    public gtype() {
    }

    public gtype(int gtypeid, String gtypename) {
        this.gtypeid = gtypeid;
        this.gtypename = gtypename;
    }

    public int getGtypeid() {
        return gtypeid;
    }

    @Override
    public String toString() {
        return "gtype{" +
                "gtypeid=" + gtypeid +
                ", gtypename='" + gtypename + '\'' +
                '}';
    }

    public void setGtypeid(int gtypeid) {
        this.gtypeid = gtypeid;
    }

    public String getGtypename() {
        return gtypename;
    }

    public void setGtypename(String gtypename) {
        this.gtypename = gtypename;
    }
}
