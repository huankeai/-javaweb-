<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022/4/11
  Time: 22:58
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
<style>
    body{
        background-image: url(img/kaool.png);
        background-repeat: no-repeat;
        width: 100%;
        height: 100%;
    }
    h1{
        font-size: 100px;
        color: red;
        font-family: 宋体;
        text-align: center;
    }
    .sub_kaifa{
        width: 200px;
        height: 45px;
        border-radius: 15px;
        font-size: 15px;
        color: aliceblue;
        font-weight: bold;
        background-color: rgb(64, 64, 217);
        font-family: 微软雅黑;
    }
    .sub_kaifa:hover{
        background-color: rgb(255, 0, 0);
    }

    .div_box{
        display: flex;
        justify-content: center;
    }
</style>
<body>
<div class="beij">
    <h1>更多功能还在开发中,请尽请期待!</h1>
    <div class="div_box">
        <form action="RequestDispatcher?action=excetion" method="post">
            <input type="submit" class="sub_kaifa" value="返回上个界面">
        </form>
    </div>asd
</div>
</body>
</html>
