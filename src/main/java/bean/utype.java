package bean;

public class utype {
    int utypeid;
    String utypename;

    public utype() {
    }

    public utype(int utypeid, String utypename) {
        this.utypeid = utypeid;
        this.utypename = utypename;
    }

    @Override
    public String toString() {
        return "utype{" +
                "utypeid=" + utypeid +
                ", utypename='" + utypename + '\'' +
                '}';
    }

    public int getUtypeid() {
        return utypeid;
    }

    public void setUtypeid(int utypeid) {
        this.utypeid = utypeid;
    }

    public String getUtypename() {
        return utypename;
    }

    public void setUtypename(String utypename) {
        this.utypename = utypename;
    }
}
