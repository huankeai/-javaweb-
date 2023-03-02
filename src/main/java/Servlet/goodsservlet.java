package Servlet;

import bean.Goods;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "goodsservlet", value = "/goodsservlet")
public class goodsservlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<Goods> list = new goodsdao().DaYin();
//        HttpSession session = req.getSession();
//        session.setAttribute("list",list);
//        req.getRequestDispatcher("index.jsp").forward(req,resp);

    }
}
