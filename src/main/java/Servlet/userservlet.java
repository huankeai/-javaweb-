package Servlet;

import JavaDao.userdao;
import bean.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

@WebServlet(name = "userservlet", value = "/userservlet")
public class userservlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");

        String action =req.getParameter("action");
        switch (action){
            case "login":
                try {
                    dologin(req,resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "show":
                doShow(req,resp);
                break;
            case "register":
                doregister(req,resp);
                break;
        }
    }

    private void doregister(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String reuname=req.getParameter("regname");
        String reupassword=req.getParameter("regpass");
        String reregpass=req.getParameter("reregpass");
        PrintWriter out=resp.getWriter();


        if (reuname.equals("")||reupassword.equals("")){
            out.print("<script>alert('用户名或密码不能为空！');location.href='login.jsp'</script>");
            out.flush();
        }
        if (reupassword.equals(reregpass)){
            if (new userdao().register(reuname,reupassword)==1){
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }else {
                out.print("<script>alert('注册失败！');location.href='login.jsp'</script>");
                out.flush();
            }
        }else{
            out.print("<script>alert('2次密码不一样！');location.href='login.jsp'</script>");
            out.flush();
        }


    }

    private void doShow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    private void dologin(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        String uname=req.getParameter("name");
        String upassword=req.getParameter("pass");
        PrintWriter out=resp.getWriter();
        if (uname.equals("")||upassword.equals("")){

            out.print("<script>alert('用户名或密码不能为空！');</script>");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
            out.flush();
        }
        user user=new userdao().selectuser(uname,upassword);
        if (user==null){
            out.print("<script>alert('用户名或密码错误');</script>");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
            out.flush();
        }

        user.setUname(uname);
        user.setUpassword(upassword);

        if (user.getUname()==uname&&user.getUpassword()==upassword){
            HttpSession sess = req.getSession();
            sess.setAttribute("user",user);
            //req.setAttribute("user",user);
            out.print("<script>alert('欢迎用户"+user.getUname()+"');</script>");
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }


    }
}
