<%@ page import="java.util.List" %>
<%@ page import="bean.Goods" %>
<%@ page import="nameimg.ListG" %>
<%@ page import="bean.user" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022/4/18
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
<style>
    .table_kaaa{
        width: 85%;
        border: 1px solid silver;
        padding-bottom: 200px;
    }
    tr{
        height: 33px;
    }
</style>
<body>
<%
    user user =(user) session.getAttribute("user");
%>
<h1>当前用户id:<%=user.getUname()%></h1>
<table class="table_kaaa">
    <tr>
        <th>商品id:</th>
        <th>商品名字</th>
        <th>项目类型id</th>
        <th>商品价格</th>
        <th>商品库存</th>
        <th>商品描述</th>
        <th>店铺id</th>
        <th>商家id</th>
        <th>图片</th>
        <th>操作</th>
    </tr>
    <%
//        List<Goods> list = (List<Goods>) session.getAttribute("listShop");
        List<Goods> list = new ListG().chakan();
        for (Goods g:list){
    %>
    <tr>
        <td><%=g.getGid()%></td>
        <td><%=g.getGname()%></td>
        <td><%=g.getGtypeid()%></td>
        <td><%=g.getPrice()%></td>
        <td><%=g.getStock()%></td>
        <td><%=g.getDescribe()%></td>
        <td><%=g.getSid()%></td>
        <td><%=g.getSuid()%></td>
        <td><img src="<%=g.getPaddr()%>" width="60px"></td>
        <td><a href=""  onclick="return confirm('确定删除？')">删除</a></td>
    </tr>
    <%}%>
    <tr>
  <a href="RequestDispatcher?action=clearGo"><input type="button" value="清空购物车"></a>
    </tr>
    </table>
<jsp:include page="WeiBu.jsp"></jsp:include>
</body>
</html>
