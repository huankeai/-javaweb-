package Servlet;

import JavaDao.JavaDaoLogo;
import bean.Goods;
import bean.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletComm", value = "/ServletComm")
public class ServletComm extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //运行这个Servlet 初始化商品
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");


        List<Goods> list = new JavaDaoLogo().DaYin();
        HttpSession session = req.getSession();
        session.setAttribute("list",list);
        user user = (user) session.getAttribute("user");
        session.setAttribute("user",user);

        req.getRequestDispatcher("index.jsp").forward(req,resp);

    }


}
