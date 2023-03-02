package Servlet;

import JavaDao.JavaDaoLogo;
import bean.Goods;
import bean.user;
import nameimg.ListG;
import nameimg.userDaple;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RequestDispatcher", value = "/RequestDispatcher")
public class RequestDispatcher extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        String action=req.getParameter("action");
        switch (action){
            case "excetion":
                doexceltion(req,resp);
                break;
            case  "shopId":
                doShopId(req,resp);
                break;
            case  "tuichu":
                dotuichu(req,resp);
                break;
            case  "Del":
                doDel(req,resp);
                break;
            case  "ShopAdd":
                doShopAdd(req,resp);
                break;
            case  "clearGo":
                doClear(req,resp);
                break;
        }
    }

    private void doClear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        new ListG().clear();

        PrintWriter out = resp.getWriter();
        out.print("<script>alert('使用清空');</script>");
        req.getRequestDispatcher("gowucheMi.jsp").forward(req,resp);
    }

    private void doShopAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("跑到这里dOsHOPaDD");
        PrintWriter out = resp.getWriter();
        String id=req.getParameter("id");
        Goods goods1 = new JavaDaoLogo().ShopId2(Long.parseLong(id));
        System.out.println("跑goods1"+goods1);
        new ListG().addlist(goods1);
//        HttpSession session = req.getSession();
//        session.setAttribute("listShop",list);
        System.out.println(new ListG());
        doShopId(req,resp);
    }

    private void doDel(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        PrintWriter out = resp.getWriter();
        String id=req.getParameter("id");
        boolean del = new JavaDaoLogo().Del(Long.parseLong(id));
        if (del){
            out.println("<script>alert('删除成功');</script>");
            req.getRequestDispatcher("liebiao.jsp").forward(req,resp);
        }else {
            out.println("<script>alert('删除失败');</script>");
            req.getRequestDispatcher("liebiao.jsp").forward(req,resp);
        }
    }

    private void dotuichu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        user user=new user();
        user=null;
        //req.setAttribute("user",user);
        System.out.println("运行到了这里");
        HttpSession session = req.getSession();
        //删除购物车全部数据
        new ListG().clear();
        session.removeAttribute("user");
        req.getRequestDispatcher("ServletComm").forward(req,resp);
    }

    private void doShopId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Id = req.getParameter("id");
        Goods g = new Goods();
        g.setGid(Long.parseLong(Id));
        Goods goods = new JavaDaoLogo().ShopId(g);
        req.setAttribute("goods",goods);
        req.getRequestDispatcher("ShopID.jsp").forward(req,resp);
    }

    private void doexceltion(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.getRequestDispatcher("ServletComm").forward(req,resp);
    }

}
