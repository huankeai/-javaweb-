<%@ page import="bean.Goods" %>
<%@ page import="bean.user" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022/4/13
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

</head>
<link rel="stylesheet" href="logocss.css">
<style>
    body{
        background-color: #eff1f3;
    }
    .div_to_2{
        background-color: #ffffff;
    }
    .div_to{
        padding:0% 10%;
        padding-bottom: 5%;
    }
    .imgcel{
        border: 5px solid #eaebec;
        border-radius: 5px;
    }
    .imgcel:hover{
        width: 520px;
        height: 490px;
        transition: all 500ms;
    }
    .asd{
        display: flex;
        justify-content: center;
        width: 100%;
        background-color: #ffffff;
    }
    .div_q{
        display: inline;
    }
    .imgdiv{
        width: 480px;
        height: 450px;
        display: flex;
    }
    .div_to_2{
        display: flex;
        grid-row: 2;
    }

    .div_ti{
        display: block;
        padding-top: 100px;
        padding-left: 60px;
    }
    #input_t{
        font-size: 19px;
        font-family: 宋体;
        width: 150px;
        height: 35px;
        background-color: #f35156;
        margin: 30px;
        border-radius: 5px;
    }
    #input_t:hover{
        background-color: #1f6aff;
    }
    .h1_poiu{
        color: chocolate;
        font-family: 宋体;
    }
    #input_tx{
        font-size: 19px;
        font-family: 宋体;
        width: 150px;
        height: 35px;
        background-color: #f35156;
        margin: 30px;
        border-radius: 5px;
    }
    #input_tx:hover{
        background-color: #1f6aff;
    }
    #input_c{
        font-size: 19px;
        font-family: 宋体;
        width: 150px;
        height: 35px;
        background-color: #1f6aff;
        margin: 30px;
        border-radius: 5px;
    }
    #input_c:hover{
        background-color: #f35156;
    }
    .red{
        color: #e62129;
    }
    .h1_h1{
        text-align: right;
        display: flex;
        justify-content: right;
        padding-right: 300px;
        color: #e62129;
    }
    .h1_poiu1{
        font-size: 24px;
        font-family: 宋体;
        color: #3c3c3c;
    }
    .h1_poiu2{
        font-size: 30px;
        font-family: 宋体;
        color: red;
    }
    .bpo{
        font-weight: bold;
    }
</style>
<body>
<script src="js/jquery-3.3.1.min.js"></script>
<div>
    <div class="div_dingye">
        <span id="sp_hui">本网站以供方便大学生在校购买商品，可买任何类型的商品服务</span>
        <span id="sp_hui2">联系电话 1737****994</span>
        <span id="sp_hui3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 更多功能还在开发中</span>

    </div>
<%--购物车--%>
    <%
        user user =(user) session.getAttribute("l");
        Goods g = (Goods)request.getAttribute("goods");
        session.setAttribute("user",user);
        if (user!=null){
    %>
    <span class="h1_h1">当前用户:<%=user.getUname()%></span>
        <%}else {%>
    <span class="h1_h1">当前用户:<a href="login.jsp">未登录</a></span>
        <%};%>
<div class="div_to">
    <div class="asd"><img src="img/logo.png" alt="" class="imgceop">
    </div>
    <div class="div_to_2">
        <div class="imgdiv"><img src="<%=g.getPaddr()%>" alt="" width="480px" height="450px" class="imgcel"></div>

        <form action="">

            <div class="div_ti">
                <h1 class="h1_poiu1"><%=g.getGname()%></h1>
                <span>价格:</span><span class="h1_poiu2"><%=g.getPrice()%></span><br>
                <span>库存:</span><span class="h1_poiu2" style="color: #161616"><%=g.getStock()%></span><br>
                <span>数量:</span>
                <input type="button" value="+" id="jia">
                <input type="text" style="width: 15px;" value="1" id="kil">
                <input type="button" value="-" id="jian">


<%--                <h1 class="h1_poiu">商品详情:<%=g.getDescribe()%></h1>--%>
                <h1 class="h1_poiu1">  <b class="bpo">详情:</b><%=g.getDescribe()%></h1>

                <div>
                    <%
                    session.setAttribute("user",user);
                    if (user!=null){
                    %>
                    <a href=""><input type="button" value="购买商品" id="input_t"  onclick="window.alert('是否购买?')"></a>
                    <a href="RequestDispatcher?action=ShopAdd&id=<%=g.getGid()%>"><input type="button" value="添加至购物车" id="input_tx" onclick="return confirm('是否加入购物车？')"></a>
                    <%}else {%>
                    <a href=""><input type="button" value="购买商品" id="input_t"  onclick="window.alert('请登录，才能进行操作')"></a>
                    <a href=""><input type="button" value="添加至购物车" id="input_tx" onclick="window.alert('请登录，才能进行操作')"></a>
                    <%};%>

                    <a href="ServletComm"><input type="button" value="返回主界面" id="input_c"></a>
                </div>
            </div>
        </form>

    </div>
</div>

<jsp:include page="WeiBu.jsp"></jsp:include>

    <script>
        $(function(){
            $("#jia").click(function(){
                var a=parseInt($("#kil").val());
                $("#kil").val(a+1);
            })

            $("#jian").click(function(){
                var a=parseInt($("#kil").val());
                if(a==0){
                }else{
                    $("#kil").val(a-1);
                }

            })
        })
    </script>
</body>
</html>
