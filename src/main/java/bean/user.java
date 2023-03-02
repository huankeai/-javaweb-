package bean;

public class user {
    int uid;
    String uname;
    String upassword;
    int utypeid;
    String sex;
    String img;

    public user() {
    }

    public user(int uid, String uname, String upassword, int utypeid, String sex, String img) {
        this.uid = uid;
        this.uname = uname;
        this.upassword = upassword;
        this.utypeid = utypeid;
        this.sex = sex;
        this.img = img;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public int getUtypeid() {
        return utypeid;
    }

    public void setUtypeid(int utypeid) {
        this.utypeid = utypeid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "user{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", utypeid=" + utypeid +
                ", sex='" + sex + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
