package Servlet;

import JavaDao.JavaDaoLogo;
import bean.Goods;
import nameimg.DateHelp;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ServletAdd", value = "/ServletAdd")
public class ServletAdd extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        try {
            doMace(req,resp,out);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void doMace(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) throws Exception {

        //1.构建一个磁盘工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //1.1 设置大小
        factory.setSizeThreshold(1024*9);
        //1.2 临时仓库
        File file = new File("c:\\temp");
        if(!file.exists()){
            file.mkdir();//创建文件夹
        }
        factory.setRepository(file);

        //2.文件上传+表单数据
        ServletFileUpload fileUpload = new ServletFileUpload(factory);

        //3.将请求解析成一个个FileItem(文件+表单元素)
        List<FileItem> fileItems = fileUpload.parseRequest(req);

        //4.遍历FileItem
        Goods g=new Goods();
        for(FileItem  item: fileItems){
            if(item.isFormField()){
                //4.1 元素名称和用户填写的值  name: 文城
                String  name = item.getFieldName();
                String value = item.getString("utf-8");//防止乱码
                switch(name){
//                        g.setGid(Long.parseLong(value));
                    case "gname":
                        g.setGname(value);
                        break;
                    case "gtypeid":
                       g.setGtypeid(Long.parseLong(value));
                        break;
                    case "price":
                        g.setPrice(Double.parseDouble(value));
                        break;
                    case "stock":
                        g.setStock(Long.parseLong(value));
                        break;
                    case "describe":
                        g.setDescribe(value);
                        break;
                    case "sid":
                        g.setGid(Long.parseLong(value));
                        break;
                    case "suid":
                       g.setSid(Long.parseLong(value));
                        break;
                }
                System.out.println(g);
            }else {
                //4.2 文件: 图片的文件名  文城.png,用户不选择图片时，fileName的数据为""
                String fileName = item.getName();
                //避免文件替换：当前的系统时间.png
                if(fileName.trim().length()>0) {
                    //4.2.1 获取后缀名 .png
                    String filterName = fileName.substring(fileName.lastIndexOf("."));
                    //4.2.2 修改文件名  20211117112512234.png
                    fileName = DateHelp.getImageName() + filterName;
                    //保存到哪里
                    //虚拟路径: Images/cover/1-1.png
                    //文件的读写:实际路径 D://xx  --> 虚拟路径: Images/cover对应的实际路径
//                    String path = req.getServletContext().getRealPath("/Images/cover");
//                    String path ="E:\\dev\\web\\img";
                    String path ="E:\\dev\\out\\artifacts\\dev_war_exploded\\img";
                    System.out.println(path);
                    //d:/xxx/xx/ 20211117112512234.png
                    String filePath = path + "/" + fileName;
                    //数据库表中的路径 ：Images/cover/101-1.png：相对项目的根目录的位置
//                    String dbPath = "Images/cover/" + fileName;
                    String dbPath = "img/" + fileName;
                    g.setPaddr(dbPath);

                    //4.3 保存文件
                    item.write(new File(filePath));
                    System.out.println();
                }
            }
        }

        //5.将信息保存到数据库
        boolean b = new JavaDaoLogo().ADD(g.getGname(), g.getGtypeid(), g.getPrice(), g.getStock(), g.getDescribe(), g.getSid(), g.getSuid(), g.getPaddr());
//        int count = bookBiz.modify(book);
//        boolean b = new ImgdDao().ADDcc(im);
//        if(count>0){
        System.out.println(b);
        if(b){
            out.println("<script>alert('修改书籍成功');location.href='book_add.jsp';</script>");
        }else{
            out.println("<script>alert('修改书籍失败');location.href='book_add.jsp';</script>");
        }
    }

}
