<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="JavaDao.JavaDaoLogo" %>
<%@ page import="bean.Goods" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022/4/18
  Time: 7:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .table_cl{
        border: 1px solid silver;
        margin:10px 20px;
        collapse: collapse;
    }
</style>
<body>
<table class="table_cl">
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
        List<Goods> goods = new JavaDaoLogo().DaYin();
        for (Goods g:goods){
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
        <td><img src="<%=g.getPaddr()%>" width="30px"></td>
        <td><a href="RequestDispatcher?action=Del&id=<%=g.getGid()%>"  onclick="return confirm('确定删除？')">删除</a></td>
        </tr>
  <%}%>
</table>

</body>
</html>
