package nameimg;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateHelp {
    public static String getImageName(){
        SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmssS");
        return sdf.format(new Date());
    }

    public static void main(String[] args) {
        System.out.println(getImageName());
    }
}
